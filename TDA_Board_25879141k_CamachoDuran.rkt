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

;avance