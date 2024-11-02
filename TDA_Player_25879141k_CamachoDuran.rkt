#lang racket
(provide (all-defined-out))

;GETTERS:

;Descripcion:Función auxiliar para obtener id
;Dom: player(player)
;rec: id(number)
(define (get-id player)
  (car player))

;Descripcion:Función auxiliar para obtener name
;Dom: player(player)
;rec: name(string)
(define (get-name player)
  (cadr player))

;Descripcion:Función auxiliar para obtener color
;Dom: player(player)
;rec: color(string)
(define (get-color player)
  (caddr player))

;Descripcion:Función auxiliar para obtener wins
;Dom: player(player)
;rec: wins(number)
(define (get-wins player)
  (cadddr player))

;Descripcion:Función auxiliar para obtener losses
;Dom: player(player)
;rec: losses(number)
(define (get-losses player)
  (car (cdr (cdr (cdr (cdr player))))))

;Descripcion:Función auxiliar para obtener draws
;Dom: player(player)
;rec: draws(number)
(define (get-draws player)
  (car (cdr (cdr (cdr (cdr (cdr player)))))))

;Descripcion:Función auxiliar para obtener remaining-pieces
;Dom: player(player)
;rec: remaining-pieces(number)
(define (get-remaining-pieces player)
  (car (cdr (cdr (cdr (cdr (cdr (cdr player))))))))

;Descripcion:Función auxiliar para disminuir las piezas
;Dom: player(player)
;rec: remaining-pieces(number)
(define (menos-remaining-piece player)
  (- (get-remaining-pieces player) 1))

;Descripcion:Función auxiliar para actualizar las piezas
;Dom: player(player)
;rec: player(player)
(define (player-update-remaining-pieces player)
  (list (get-id player)
          (get-name player)
          (get-color player)
          (get-wins player)
          (get-losses player)
          (get-draws player)
          (menos-remaining-piece player)))

;;REQUERIMIENTO 2: Función que permite crear un player
;Dom: id (int) X name (string) X color (string) X wins (int) X losses (int) X draws (int) X remaining-pieces (int)
;Rec: player
;Tipo de recursividad: No aplica
;CONSTRUCTOR

(define (player id name color wins losses draws remaining-pieces)
  (list id name color wins losses draws remaining-pieces))


