#lang racket
(require "TDA_Board_25879141k_CamachoDuran.rkt")
(require "TDA_Piece_25879141k_CamachoDuran.rkt")
(require "TDA_Player_25879141k_CamachoDuran.rkt")
(require "TDA_Game_25879141k_CamachoDuran.rkt")
(provide (all-defined-out))

(define p1(player 1 "Macarena" "red" 100 0 0 21))
(define p2(player 2 "Kristel" "yellow" 50 25 25 21))
(define p3(player 1 "Kristian" "red" 25 50 25 21))
p1
p2
p3

(define red-piece(piece "red"))
(define yellow-piece(piece "yellow"))
(define red-piece2(piece "red"))
red-piece
yellow-piece
red-piece2

(define b0(board))
(define b1(board))
(define b2(board))
b0
b1
b2

(board-can-play? b0)
(board-can-play? b1)
(board-can-play? b2)

(board-set-play-piece b1 3 red-piece)
(board-set-play-piece b2 4 yellow-piece)
(board-set-play-piece b1 5 red-piece)


(define b1.1(board-set-play-piece b1 3 yellow-piece))
(define b1.2(board-set-play-piece b1.1 3 yellow-piece))
(define b1.3(board-set-play-piece b1.2 3 yellow-piece))
(define b1.4(board-set-play-piece b1.3 3 yellow-piece))
(define b2.1(board-set-play-piece b2 4 red-piece))
(define b2.2(board-set-play-piece b2.1 4 red-piece))
(define b2.3(board-set-play-piece b2.2 4 red-piece))
(define b2.4(board-set-play-piece b2.3 4 red-piece))
(board-check-vertical-win b0)
(board-check-vertical-win b1.4)
(board-check-vertical-win b2.4)


(define b4(board))
(define b5(board))
(define b4.1(board-set-play-piece b4 3 yellow-piece))
(define b4.2(board-set-play-piece b4.1 2 yellow-piece))
(define b4.3(board-set-play-piece b4.2 1 yellow-piece))
(define b4.4(board-set-play-piece b4.3 0 yellow-piece))
(define b5.1(board-set-play-piece b5 6 red-piece))
(define b5.2(board-set-play-piece b5.1 5 red-piece))
(define b5.3(board-set-play-piece b5.2 4 red-piece))
(define b5.4(board-set-play-piece b5.3 3 red-piece))
(board-check-horizontal-win b0)
(board-check-horizontal-win b4.4)
(board-check-horizontal-win b5.4)

(define b6(board))
(define b7(board))
(board-check-diagonal-win b0)
(board-check-diagonal-win b6)
(board-check-diagonal-win b7)

(board-who-is-winner b0)
(board-who-is-winner b4.4)
(board-who-is-winner b2.4)

(define g0(game p2 p1 b0 1))
(define g1(game p3 p1 b1 1))
(define g2(game p2 p3 b2 1))
g0
g1
g2

(define g(game p1 p2 b0 1))
(define g3(game p3 p1 b2.4 1))
(define g4(game p3 p2 b4.4 1))
(game-history g0)
(game-history g3)
(game-history g4)

(game-is-draw? g)
(game-is-draw? g3)
(game-is-draw? g4)

(define p2.1(player-update-stats p2 "win"))
(define p3.1(player-update-stats p3 "loss"))
(define p1.1(player-update-stats p1 "draw"))
p2.1
p3.1
p1.1

(game-get-current-player g0)
(game-get-current-player g3)
(game-get-current-player g4)

(game-get-board g0)
(game-get-board g)
(game-get-board g3)

(define g0.1(game-set-end g0))
(define g1.1(game-set-end g1))
(define g2.1(game-set-end g2))
g0.1
g1.1
g2.1

(define g0.2(game-player-set-move g0 p2 5))
(define g1.2(game-player-set-move g1 p3 1))
(define g2.2(game-player-set-move g2 p2 3))
g0.2
g1.2
g2.2

