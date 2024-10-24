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