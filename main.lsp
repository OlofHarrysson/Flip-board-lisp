;;; Tic Tac Toe 4 x 4 Puzzle
;;; Solution Template to be completed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tic-Tac-Toe Human-Playable Puzzle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Play ()
"This is the human-playable version of the game"
  (defparameter *N_Steps* 0)
  (defparameter *Sol_Path* '())
  (let (Game RndSt Move (StepCnt 0))
    (setf RndState (make-random-state t)
          Game (Init_Game RndState))
    (format t "~%~5TStart state ~%~%")
    (Display_Game Game)
    (loop
     (when (Game_Over Game) (return))
     (setf Move (Choose_Move)
           Game (Update_Game Game Move)
           StepCnt (1+ StepCnt))
     (format t "~%~5TStep ~2D   Pressed ~D ~%" StepCnt Move)
     (Display_Game Game))
    (Congratulations StepCnt)))

(defun Init_Game (&optional (RS (make-random-state t)))
"Returns a random initial game board"
(list (Make_Row RS) (Make_Row RS) (Make_Row RS) (Make_Row RS))
)

(defun Make_Row (RS)
"Returns a random initial row"
(list (random 2 RS) (random 2 RS) (random 2 RS) (random 2 RS) )
)

(defun Game_Over (G)
"Checks whether the game reached its goal state"
(if (= (length (Flatten G)) (Count_Positives (Flatten G))) T Nil)
)

(defun Flatten (l)
  (cond ((null l) nil)
    ((atom l) (list l))
    (t (loop for a in l appending (Flatten a))))
)

(defun Count_Positives (l)
 (count-if #'plusp l)
)

(defun Choose_Move ()
"Asks the user to specify the next move"
(read)
)

(defun Update_Game (G Move)
"Updates the gameoard state according to the selected move"
(cond ((= 0 Move) (Flip_Action0 G))
      ((= 1 Move) (Flip_Action1 G))
      ((= 2 Move) (Flip_Action2 G))
      ((= 3 Move) (Flip_Action3 G))
      ((= 4 Move) (Flip_Action4 G))
      ((= 5 Move) (Flip_Action5 G))
      ((= 6 Move) (Flip_Action6 G))
      ((= 7 Move) (Flip_Action7 G))
      ((= 8 Move) (Flip_Action8 G))
      ((= 9 Move) (Flip_Action9 G))
      ((= 10 Move) (Flip_Action10 G))
      ((= 11 Move) (Flip_Action11 G))
      ((= 12 Move) (Flip_Action12 G))
      ((= 13 Move) (Flip_Action13 G))
      ((= 14 Move) (Flip_Action14 G))
      ((= 15 Move) (Flip_Action15 G))
)
G
)

(defun Get_Value_At_Index (G i)
(nth (Index_To_Col i) (nth (Index_To_Row i) G))
)

(defun Index_To_Row (i)
(floor i 4)
)

(defun Index_To_Col (i)
(rem i 4)
)

(defun Row_Col_To_Index (row col)
(+ (* row 4) col)
)

(defun Flip (row col G)
"Flips the marker at the position given by row and col"
(setf (nth col (nth row G)) (- 1 (nth col (nth row G))))
G
)

(defun Display_Game (G)
"Displays the actual board state"
(write-line "")
(format t "~{~{~a~^ ~}~%~}" G)
)

(defun Congratulations (Steps)
"Displays some concluding message"
(print "Congrats")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tic-Tac-Toe Automatic Puzzle Solver
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Auto_Play ()
"This is the automatic problem solver"
  (let (Game RndSt Move (StepCnt 0))
    (setf RndState (make-random-state t)
          Game (Init_Game RndState))
    (format t "~%~5TStart state ~%~%")
    (Display_Game Game)
    (Auto_Play_Game Game StepCnt)))

(defun Auto_Play_Game (Game Steps)
"Solves the game and displays the resulting solution path accordingly"
(defparameter *N_Steps* Steps)
(defparameter *Sol_Path* '())
(loop
  for i from 0 to 15
  do (cond ((= 0 (Get_Value_At_Index Game i)) (Flip_Only i Game)))
)
(write-line "")
(format t "~d ~d~%" "Number of steps needed to solve: " *N_Steps*)
(format t "~d ~d~%" "Solution path: " *Sol_Path*)
(Display_Game Game)
)


(defun Flip_Only (index G)
"Flips only the box given by row and col by calling multiple flip actions and itself recursivly"

(cond ((= index 4)
          (Flip_Action1 G)
          (Flip_Action0 G)
      )
      ((= index 7)
          (Flip_Action2 G)
          (Flip_Action3 G)
      )
      ((= index 13)
          (Flip_Action8 G)
          (Flip_Action12 G)
      )
      ((= index 14)
          (Flip_Action11 G)
          (Flip_Action15 G)
      )
      ((= index 1)
          (Flip_Action4 G)
          (Flip_Action0 G)
      )
      ((= index 2)
          (Flip_Action7 G)
          (Flip_Action3 G)
      )
      ((= index 8)
          (Flip_Action5 G)
          (Flip_Action0 G)
          (Flip_Action1 G)
          (Flip_Action4 G)
          (Flip_Only 2 G)
      )
      ((= index 10)
          (Flip_Action13 G)
          (Flip_Action12 G)
          (Flip_Only 8 G)
      )
      ((= index 5)
          (Flip_Action10 G)
          (Flip_Only 13 G)
          (Flip_Only 10 G)
          (Flip_Only 7 G)
      )
      ((= index 0)
          (Flip_Action0 G)
          (Flip_Only 4 G)
          (Flip_Only 1 G)
          (Flip_Only 5 G)
      )
      ((= index 9)
          (Flip_Action6 G)
          (Flip_Action2 G)
          (Flip_Action7 G)
          (Flip_Action3 G)
          (Flip_Only 1 G)
      )
      ((= index 12)
          (Flip_Action13 G)
          (Flip_Only 9 G)
          (Flip_Only 10 G)
          (Flip_Only 13 G)
      )
      ((= index 15)
          (Flip_Action14 G)
          (Flip_Only 14 G)
          (Flip_Only 10 G)
          (Flip_Only 9 G)
      )
      ((= index 11)
          (Flip_Action11 G)
          (Flip_Only 10 G)
          (Flip_Only 15 G)
      )
      ((= index 6)
          (Flip_Action9 G)
          (Flip_Only 9 G)
          (Flip_Only 4 G)
          (Flip_Only 12 G)
      )
      ((= index 3)
          (Flip_Action2 G)
          (Flip_Action7 G)
          (Flip_Action3 G)
          (Flip_Only 6 G)
      )
)

)



(defun Inc_Step_And_Path (Action_Number)
(setf *N_Steps* (+ 1 *N_Steps*))
(setf *Sol_Path* (append *Sol_Path* (list Action_Number) ))
)

; "Flip_Action performs the flip by calling flip for the actions indexes"
(defun Flip_Action0 (G)
(flip 0 0 G)
(flip 0 1 G)
(flip 1 0 G)
(flip 1 1 G)
(setf *N_Steps* (+ 1 *N_Steps*))
(Inc_Step_And_Path 0)
)

(defun Flip_Action1 (G)
(flip 0 0 G)
(flip 0 1 G)
(flip 1 1 G)
(Inc_Step_And_Path 1)
)

(defun Flip_Action2 (G)
(flip 0 2 G)
(flip 0 3 G)
(flip 1 2 G)
(Inc_Step_And_Path 2)
)

(defun Flip_Action3 (G)
(flip 0 2 G)
(flip 0 3 G)
(flip 1 2 G)
(flip 1 3 G)
(Inc_Step_And_Path 3)
)

(defun Flip_Action4 (G)
(flip 0 0 G)
(flip 1 0 G)
(flip 1 1 G)
(Inc_Step_And_Path 4)
)

(defun Flip_Action5 (G)
(flip 0 0 G)
(flip 0 2 G)
(flip 1 1 G)
(flip 2 0 G)
(Inc_Step_And_Path 5)
)

(defun Flip_Action6 (G)
(flip 0 1 G)
(flip 0 3 G)
(flip 1 2 G)
(flip 2 1 G)
(Inc_Step_And_Path 6)
)

(defun Flip_Action7 (G)
(flip 0 3 G)
(flip 1 2 G)
(flip 1 3 G)
(Inc_Step_And_Path 7)
)

(defun Flip_Action8 (G)
(flip 2 0 G)
(flip 2 1 G)
(flip 3 0 G)
(Inc_Step_And_Path 8)
)

(defun Flip_Action9 (G)
(flip 1 0 G)
(flip 1 2 G)
(flip 2 1 G)
(flip 3 0 G)
(Inc_Step_And_Path 9)
)

(defun Flip_Action10 (G)
(flip 1 1 G)
(flip 1 3 G)
(flip 2 2 G)
(flip 3 1 G)
(Inc_Step_And_Path 10)
)

(defun Flip_Action11 (G)
(flip 2 2 G)
(flip 2 3 G)
(flip 3 3 G)
(Inc_Step_And_Path 11)
)

(defun Flip_Action12 (G)
(flip 2 0 G)
(flip 2 1 G)
(flip 3 0 G)
(flip 3 1 G)
(Inc_Step_And_Path 12)
)

(defun Flip_Action13 (G)
(flip 2 1 G)
(flip 2 2 G)
(flip 3 0 G)
(flip 3 1 G)
(Inc_Step_And_Path 13)
)

(defun Flip_Action14 (G)
(flip 2 1 G)
(flip 2 2 G)
(flip 3 2 G)
(flip 3 3 G)
(Inc_Step_And_Path 14)
)

(defun Flip_Action15 (G)
(flip 2 2 G)
(flip 2 3 G)
(flip 3 2 G)
(flip 3 3 G)
(Inc_Step_And_Path 15)
)

; ################################ Play Game ################################

(Play)
; (Auto_Play)

; ################################ UNIT TESTS ################################

(defun Test_Display ()
(Display_Game '( (1 2 3 4)(5 6 7 8)(9 10 11 12)(13 14 15 16) ) )
)

(defun Test_Game_Over ()
(write (Game_Over (Init_Game (make-random-state t)))) ; Should write false
(write (Game_Over '( (1 1 1 1)(1 1 1 1)(1 1 1 1)(1 1 1 1) ) )) ; Should write true
)

(defun Test_Flip ()
(setf Game (Init_Game (make-random-state t)))
(Display_Game Game)
(Flip 0 0 Game)
(Flip 3 3 Game)
(Flip 2 1 Game)
(Display_Game Game)
)

(defun Test_Flip_Action ()
(setf Game (Init_Game (make-random-state t)))
(Display_Game Game)
(Flip_Action3 Game)
(Display_Game Game)
)

(defun Test_Row_Col_To_Index ()
(write (Row_Col_To_Index 0 0)) ; Should be 0
(write-line "")
(write (Row_Col_To_Index 1 0)) ; Should be 4
(write-line "")
(write (Row_Col_To_Index 3 3)) ; Should be 15
)

(defun Test_Flip_Only ()
; (setf Game (Init_Game (make-random-state t)))
(setf Game '( (1 1 1 1)(1 1 1 1)(1 1 1 1)(1 1 1 1) ))
(Display_Game Game)
(Flip_Only 8 Game)
(Display_Game Game)
)

(defun Test_Row_From_Index ()
 (write (Index_To_Row 4))
)

(defun Test_Col_From_Index ()
 (write (Index_To_Col 0))
)

(defun Test_Get_Value_At_Index ()
 (setf Game (Init_Game (make-random-state t)))
 (Display_Game Game)
 (write (Get_Value_At_Index Game 0))
)

; ################################ RUN UNIT TESTS ################################

; (Test_Flip_Action)
; (Test_Row_Col_To_Index)
; (Test_Flip_Only)
; (Test_Row_From_Index)
; (Test_Col_From_Index)
; (Test_Get_Value_At_Index)
