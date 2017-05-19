;;; Tic Tac Toe 4 x 4 Puzzle
;;; Solution Template to be completed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Tic-Tac-Toe Human-Playable Puzzle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Play ()
"This is the human-playable version of the game"
  (let (Game RndSt Move (StepCnt 0))
    (setf RndState (make-random-state t)
          Game (Init_Game RndState))
    (format t "~%~5TStart state ~%~%")
    (Display_Game Game)
    (loop
     (when (Game_Over G) (return))
     (setf Move (Choose_Move)
           G (Update_Game G Move)
           StepCnt (1+ StepCnt))
     (format t "~%~5TStep ~2D   Pressed ~D ~%" StepCnt Move)
     (Display_Game G))
    (Congratulations StepCnt)))

(defun Init_Game (&optional (RS (make-random-state t)))
"Returns a random initial game board"
)

(defun Game_Over (G)
"Checks whether the game reached its goal state"
)

(defun Choose_Move ()
"Asks the user to specify the next move"
)

(defun Update_Game (G Move)
"Updates the gameoard state according to the selected move"
)

(defun Display_Game (G)
"Displays the actual board state"
)

(defun Congratulations (Steps)
"Displays some concluding message"
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
)

