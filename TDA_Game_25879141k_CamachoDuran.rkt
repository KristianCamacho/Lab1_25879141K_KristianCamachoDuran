#lang racket
(require "TDA_Board_25879141k_CamachoDuran.rkt")
(require "TDA_Piece_25879141k_CamachoDuran.rkt")
(require "TDA_Player_25879141k_CamachoDuran.rkt")
(provide (all-defined-out))

;GETTERS:

;Descripcion:Función auxiliar para obtener player1
;Dom: game(game)
;rec: player1(string)
(define (get-p1-game game)
  (car game))

;Descripcion:Función auxiliar para obtener player2
;Dom: game(game)
;rec: player2(string)
(define (get-p2-game game)
  (cadr game))

;Descripcion:Función auxiliar para obtener board
;Dom: game(game)
;rec: board(list)
(define (get-board-game game)
  (caddr game))

;Descripcion:Función auxiliar para obtener el current turn
;Dom: game(game)
;rec: turn(int)
(define (get-current-turn-game game)
  (cadddr game))

;REQUERIMIENTO 11: Función que permite crear una nueva partida.
;Dom: player1 (player) X player2 (player) X board (board) X current-turn (int)
;Rec: game
;Tipo de recursividad: No aplica
;CONSTRUCTOR

(define (game player1 player2 board current-turn)
  (list player1 player2 board current-turn))

;REQUERIMIENTO 12: Función que genera un historial de movimientos de la partida.
;Dom: game(game)
;Rec: lista de movimientos(list)
;Tipo de recursividad: no aplica

(define (game-history game)
  (get-history (get-board-game game)))
  
;REQUERIMIENTO 13: Función que verifica si el estado actual del juego es empate.
;Dom: game(game)
;Rec: boolean (#t si es empate, #f si no)
;Tipo de recursividad: No aplica

(define (game-is-draw? game)
  (let ((board (caddr game)))
    (and (not (board-can-play? board))
         (= (board-who-is-winner board) 0))))

;REQUERIMIENTO 14: Función que actualiza las estadísticas del jugador, ya sea victoria, derrotas o empates.
;Dom: player (player) X result (string: "win", "loss", o "draw")
;Rec: player actualizado(player)
;Tipo de recursividad: No aplica

(define (player-update-stats player result)
  (let ((id (get-id player))
        (name   (get-name player ))
        (color  (get-color player))
        (wins   (get-wins player))
        (losses (get-losses player))
        (draws  (get-draws player))
        (remaining-pieces (get-remaining-pieces player)))
    (cond
      ((equal? result "win") (list id name color (+ wins 1) losses draws remaining-pieces))
      ((equal? result "loss") (list id name color wins (+ losses 1) draws remaining-pieces))
      ((equal? result "draw") (list id name color wins losses (+ draws 1) remaining-pieces)))))

;REQUERIMIENTO 15: Función que obtiene el jugador cuyo turno está en curso.
;Dom: game (game)
;Rec: player
;Tipo de recursividad: No aplica

(define (game-get-current-player game)
  (if (= (cadddr game) 1)
      (cadr (car game))
      (cadr (cadr game))))

;REQUERIMIENTO 16: Función que entrega el estado actual del tablero en el juego.
;Dom: game(game)
;Rec: Board
;Tipo de recursividad: No aplica

(define (game-get-board game)
  (caddr game))

;REQUERIMIENTO 17: Función finaliza el juego actualizando las estadísticas de los jugadores según el resultado.
;Dom: game(game)
;Rec: game
;Tipo de recursividad: No aplica

(define (game-set-end game)
  (let* ((p1 (car game))
         (p2 (cadr game))
         (board (caddr game))
         (current-turn (cadddr game))
         (winner (board-who-is-winner board)))
    (cond
      ((= winner 1) (list (player-update-stats p1 "win")
                         (player-update-stats p2 "loss")
                         board
                         current-turn))
      ((= winner 2) (list (player-update-stats p1 "loss")
                         (player-update-stats p2 "win")
                         board
                         current-turn))
      (else (list (player-update-stats p1 "draw")
                  (player-update-stats p2 "draw")
                  board
                  current-turn)))))

;REQUERIMIENTO 18: Función que realiza un movimiento.
;Dom: game(game) x player(player) x column(int)
;Rec: game
;Tipo de recursividad: No aplica

(define (game-player-set-move game player column)
  (let* ((p1 (get-p1-game game))
         (p2 (get-p2-game game))
         (board (get-board-game game))
         (current-turn (get-current-turn-game game))
         (player-color (get-color player))
         (new-board (board-set-play-piece board column player-color))
         (new-current-turn (if (= current-turn 1) 2 1))
         (new-p1 (if (= current-turn 1)
                    (player-update-remaining-pieces p1)
                    p1))
         (new-p2 (if (= current-turn 2)
                    (player-update-remaining-pieces p2)
                    p2))
         (winner (board-who-is-winner new-board))
         (new-game (if (or (= winner 1) (= winner 2))
                      (game-set-end game)
                      (list new-p1 new-p2 new-board new-current-turn))))
    new-game))