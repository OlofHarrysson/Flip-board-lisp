;;; Tic Tac Toe 4 x 4 Puzzle
;;; Solution Template to be completed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tic-Tac-Toe Human-Playable Puzzle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Play ()
"This is the human-playable version of the game"
  (let (Game RndSt Move (StepCnt 0)) ; List of variables
    (setf RndState (make-random-state t) ; RndState is set to a random state
          Game (Init_Game RndState)) ; And passed into init_game which will return Game
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
(setf board (list (Make_Row RS) (Make_Row RS) (Make_Row RS) (Make_Row RS)) )
)

(defun Make_Row (RS)
"Returns a random initial row"
(list (random 2 RS) (random 2 RS) (random 2 RS) (random 2 RS) )
)

(defun Game_Over (G)
"Checks whether the game reached its goal state"
(print "Game Over Function")
(write-line "")
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
(print "Choose_move")
(write-line "")
)

(defun Update_Game (G Move)
"Updates the gameoard state according to the selected move"
(print "Update Game")
(write-line "")
)

(defun Display_Game (G)
"Displays the actual board state"
(print "Display Game")
(write-line "")
(format t "~{~{~a~^ ~}~%~}" G)
)

(defun Congratulations (Steps)
"Displays some concluding message"
(print "Congrats")
)

(Play)
; (Display_Game '( (1 2 3 4)(5 6 7 8)(9 10 11 12)(13 14 15 16) ) )
; (write (Game_Over (Init_Game (make-random-state t)))) ; Should write false
; (write (Game_Over '( (1 1 1 1)(1 1 1 1)(1 1 1 1)(1 1 1 1) ) )) ; Should write true

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
)

