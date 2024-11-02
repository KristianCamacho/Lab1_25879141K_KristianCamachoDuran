#lang racket
(provide (all-defined-out))

;GETTERS:

;Descripcion:Función auxiliar para obtener el tablero del juego
;Dom: board(board)
;rec: board(list)
(define (get-board board)
  (car board))

;Descripcion:Función auxiliar para obtener el historial
;Dom: board(board)
;rec: historial(list)
(define (get-history board)
  (cadr board))

;Auxiliares:

;Descripcion:Función auxiliar para verificar una posicion vacia
;Dom: row(list) x column(number)
;rec: boolean (#t si se puede colocar la pieza #f en caso contrario)
(define (row? row column)
  (and (list? row)(< column (length row))
       (and (not (null? row)) (eq? (list-ref row column) 0))))

;Descripcion:Función auxiliar para colocar la pieza
;Dom: rows(board) x column(number) x piece(string)
;rec: board
;recursion: rec nat
(define (set-piece rows column piece)
  (if (null? rows) '()
      (let ((current-row (car rows)))
        (if (row? current-row column)
            (cons (list-set current-row column piece) (cdr rows))  
              (cons current-row (set-piece (cdr rows) column piece))))))


;REQUERIMIENTO 4: Crear un tablero de Conecta4
;Dom: No recibe parametros de entrada
;Rec: board
;Tipo de recursividad: No aplica
;CONSTRUCTOR

(define (board)
  (list
   (list'(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0))
   '()))

;REQUERIMIENTO 5: Función que permite verificar si se puede realizar más jugadas en el tablero
;Dom: board(board)
;Rec: boolean (#t si se puede jugar, #f si no)
;Tipo de recursividad: Rec Tail

(define (board-can-play? board)
  (define (row? row)
    (if (null? row)#f
        (if (eq? (car row) 0)#t
            (row? (cdr row)))))
  (define (board? b)
    (if (null? b)#f
        (if (row? (car b))#t
            (board? (cdr b)))))
  (board? (get-board board)))

;REQUERIMIENTO 6: Función que permite Jugar una ficha en el tablero y registra en el historial
;Dom: board (board) X column (int) X piece (piece)
;Rec: board
;Tipo de recursividad: no aplica
(define (board-set-play-piece board column piece)
  (list
   (reverse (set-piece (reverse (get-board board)) column piece))
   (reverse(cons (list column piece) (reverse(get-history board))))))

;REQUERIMIENTO 7: Función que permite verificar el estado actual del tablero y entregar el posible ganador que cumple con la regla de conectar 4 fichas de forma vertical, 1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador vertical.
;Dom: board (board)
;Rec: ganador(int)
;Tipo de recursividad: Rec Nat

(define (board-check-vertical-win board)
  (let ((game-board (get-board board)))
    (define (check-from-position column row)
      (if (< (+ row 3) (length game-board))
          (let ((pos0 (list-ref (list-ref game-board row) column))
                (pos1 (list-ref (list-ref game-board (+ row 1)) column))
                (pos2 (list-ref (list-ref game-board (+ row 2)) column))
                (pos3 (list-ref (list-ref game-board (+ row 3)) column)))
            (cond 
              ((and (equal? pos0 '("red"))
                    (equal? pos1 '("red"))
                    (equal? pos2 '("red"))
                    (equal? pos3 '("red")))
               1)
              ((and (equal? pos0 '("yellow"))
                    (equal? pos1 '("yellow"))
                    (equal? pos2 '("yellow"))
                    (equal? pos3 '("yellow")))
               2)
              (else 0)))
          0))
    
    (define (check-column column row)
      (if (>= row (- (length game-board) 3))
          0
          (let ((result (check-from-position column row)))
            (if (> result 0)
                result
                (+ (check-column column (+ row 1)) 0)))))
    
    (define (check-all-columns column)
      (if (>= column (length (car game-board)))
          0
          (let ((result (check-column column 0)))
            (if (> result 0)
                result
                (+ (check-all-columns (+ column 1)) 0)))))
    
    (check-all-columns 0)))

;REQUERIMIENTO 8: Función que permite verificar el estado actual del tablero y entregar el posible ganador que cumple con la regla de conectar 4 fichas de forma horizontal.
;Dom: board (board)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador horizontal)
;Tipo de recursividad: Rec Nat

(define (board-check-horizontal-win board)
  (let ((game-board (get-board board)))
    (define (check-from-position row col)
      (if (< (+ col 3) (length (car game-board)))
          (let ((pos0 (list-ref (list-ref game-board row) col))
                (pos1 (list-ref (list-ref game-board row) (+ col 1)))
                (pos2 (list-ref (list-ref game-board row) (+ col 2)))
                (pos3 (list-ref (list-ref game-board row) (+ col 3))))
            (cond 
              ((and (equal? pos0 '("red"))
                    (equal? pos1 '("red"))
                    (equal? pos2 '("red"))
                    (equal? pos3 '("red")))
               1)
              ((and (equal? pos0 '("yellow"))
                    (equal? pos1 '("yellow"))
                    (equal? pos2 '("yellow"))
                    (equal? pos3 '("yellow")))
               2)
              (else 0)))
          0))
    
    (define (check-row row col)
      (if (>= col (- (length (car game-board)) 3))
          0
          (let ((result (check-from-position row col)))
            (if (> result 0)
                result
                (+ (check-row row (+ col 1)) 0)))))
    
    (define (check-all-rows row)
      (if (>= row (length game-board))
          0
          (let ((result (check-row row 0)))
            (if (> result 0)
                result
                (+ (check-all-rows (+ row 1)) 0)))))
    
    (check-all-rows 0)))

;REQUERIMIENTO 9: Función que permite verificar el estado actual del tablero y entregar el posible ganador que cumple con la regla de conectar 4 fichas de forma diagonal.
;Dom: board (board)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador diagonal)
;Tipo de recursividad: Rec nat

(define (board-check-diagonal-win board)
  (define (check-diagonal-down row col)
    (if (and (< (+ row 3) (length board))
             (< (+ col 3) (length (car board))))
        (let ((pos0 (list-ref (list-ref board row) col))
              (pos1 (list-ref (list-ref board (+ row 1)) (+ col 1)))
              (pos2 (list-ref (list-ref board (+ row 2)) (+ col 2)))
              (pos3 (list-ref (list-ref board (+ row 3)) (+ col 3))))
          (cond 
            ((and (equal? pos0 '("red"))
                  (equal? pos1 '("red"))
                  (equal? pos2 '("red"))
                  (equal? pos3 '("red")))
             1)
            ((and (equal? pos0 '("yellow"))
                  (equal? pos1 '("yellow"))
                  (equal? pos2 '("yellow"))
                  (equal? pos3 '("yellow")))
             2)
            (else 0)))
        0))
  (define (check-diagonal-up row col)
    (if (and (>= row 3)                     
             (< (+ col 3) (length (car board))))
        (let ((pos0 (list-ref (list-ref board row) col))
              (pos1 (list-ref (list-ref board (- row 1)) (+ col 1)))
              (pos2 (list-ref (list-ref board (- row 2)) (+ col 2)))
              (pos3 (list-ref (list-ref board (- row 3)) (+ col 3))))
          (cond 
            ((and (equal? pos0 '("red"))
                  (equal? pos1 '("red"))
                  (equal? pos2 '("red"))
                  (equal? pos3 '("red")))
             1)
            ((and (equal? pos0 '("yellow"))
                  (equal? pos1 '("yellow"))
                  (equal? pos2 '("yellow"))
                  (equal? pos3 '("yellow")))
             2)
            (else 0)))
        0))
  
  (define (check-position row col)
    (let ((down-result (check-diagonal-down row col))
          (up-result (check-diagonal-up row col)))
      (if (> down-result 0)
          down-result
          up-result)))

  (define (check-all-positions row col)
    (cond
      ((>= row (length board)) 0)
      ((>= col (length (car board))) (check-all-positions (+ row 1) 0))
      (else
        (let ((result (check-position row col)))
          (if (> result 0)
              result
              (check-all-positions row (+ col 1)))))))
  
  (check-all-positions 0 0))

;REQUERIMIENTO 10: Función que permite verificar el estado actual del tablero y entregar el posible ganador que cumple con la regla de conectar 4 fichas de forma diagonal, horizontal o vertical.
;Dom: board (board)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador diagonal,horizontal o vertical)
;Tipo de recursividad: No aplica

(define (board-who-is-winner board)
  (let ((vertical-winner (board-check-vertical-win board))
        (horizontal-winner (board-check-horizontal-win board))
        (diagonal-winner (board-check-diagonal-win board)))
    (cond
      ((> vertical-winner 0) vertical-winner)
      ((> horizontal-winner 0) horizontal-winner)
      ((> diagonal-winner 0) diagonal-winner)
      (else 0))))
