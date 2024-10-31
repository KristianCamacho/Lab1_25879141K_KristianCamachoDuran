#lang racket
(provide (all-defined-out))

;REQUERIMIENTO 4: Crear un tablero de Conecta4
;Dom: No recibe parametros de entrada
;Rec: board
;Tipo de recursividad: No aplica
;CONSTRUCTOR

(define (board)
  (list'(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)
       '(0 0 0 0 0 0 0)))

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
  (board? board))

;REQUERIMIENTO 6: Función que permite Jugar una ficha en el tablero
;Dom: board (board) X column (int) X piece (piece)
;Rec: board
;Tipo de recursividad: Rec Natural

(define (board-set-play-piece board column piece)
  (define (row? row)
    (and (not (null? row)) (eq? (list-ref row column) 0)))
  (define (set-piece rows column piece)
    (if (null? rows) '()  
        (let ((current-row (car rows)))
          (if (row? current-row)  
              (cons (list-set current-row column piece) (cdr rows))  
              (cons current-row (set-piece (cdr rows) column piece))))))
  
  (reverse (set-piece (reverse board) column piece)))

;REQUERIMIENTO 7: Función que permite verificar el estado actual del tablero y entregar el posible ganador que cumple con la regla de conectar 4 fichas de forma vertical.
;Dom: board (board)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador vertical)
;Tipo de recursividad: Rec Nat

(define (board-check-vertical-win board)
  ; Verifica una columna desde una posición específica
  (define (check-from-position board column row)
    (if (< (+ row 3) (length board)) ; Nos aseguramos de tener 4 espacios hacia abajo
        (let ((pos0 (list-ref (list-ref board row) column))
              (pos1 (list-ref (list-ref board (+ row 1)) column))
              (pos2 (list-ref (list-ref board (+ row 2)) column))
              (pos3 (list-ref (list-ref board (+ row 3)) column)))
          (cond 
            ((and (equal? pos0 "red")
                  (equal? pos1 "red")
                  (equal? pos2 "red")
                  (equal? pos3 "red"))
             1)
            ((and (equal? pos0 "yellow")
                  (equal? pos1 "yellow")
                  (equal? pos2 "yellow")
                  (equal? pos3 "yellow"))
             2)
            (else 0)))
        0))
  
  ; Verifica una columna completa
  (define (check-column board column row)
    (if (>= row (- (length board) 3))
        0
        (let ((result (check-from-position board column row)))
          (if (> result 0)
              result
              (+ (check-column board column (+ row 1)) 0)))))
  
  ; Verifica todas las columnas
  (define (check-all-columns board column)
    (if (>= column (length (car board)))
        0
        (let ((result (check-column board column 0)))
          (if (> result 0)
              result
              (+ (check-all-columns board (+ column 1)) 0)))))
  
  (check-all-columns board 0))