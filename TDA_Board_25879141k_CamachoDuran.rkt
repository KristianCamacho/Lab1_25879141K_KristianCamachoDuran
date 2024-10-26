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