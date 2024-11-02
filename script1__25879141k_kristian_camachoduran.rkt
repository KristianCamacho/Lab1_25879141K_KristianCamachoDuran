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

(define b0.1 (board-set-play-piece b0 0 red-piece))
(define b0.2 (board-set-play-piece b0.1 0 red-piece))
(define b0.3 (board-set-play-piece b0.2 0 yellow-piece))
(define b0.4 (board-set-play-piece b0.3 0 yellow-piece))
(define b0.5 (board-set-play-piece b0.4 0 red-piece))
(define b0.6 (board-set-play-piece b0.5 0 yellow-piece))
(define b0.7 (board-set-play-piece b0.6 1 yellow-piece))
(define b0.8 (board-set-play-piece b0.7 1 yellow-piece))
(define b0.9 (board-set-play-piece b0.8 1 red-piece))
(define b0.10 (board-set-play-piece b0.9 1 red-piece))
(define b0.11 (board-set-play-piece b0.10 1 yellow-piece))
(define b0.12 (board-set-play-piece b0.11 1 red-piece))
(define b0.13 (board-set-play-piece b0.12 2 red-piece))
(define b0.14 (board-set-play-piece b0.13 2 yellow-piece))
(define b0.15 (board-set-play-piece b0.14 2 yellow-piece))
(define b0.16 (board-set-play-piece b0.15 2 red-piece))
(define b0.17 (board-set-play-piece b0.16 2 red-piece))
(define b0.18 (board-set-play-piece b0.17 2 yellow-piece))
(define b0.19 (board-set-play-piece b0.18 3 red-piece))
(define b0.20 (board-set-play-piece b0.19 3 red-piece))
(define b0.21 (board-set-play-piece b0.20 3 yellow-piece))
(define b0.22 (board-set-play-piece b0.21 3 yellow-piece))
(define b0.23 (board-set-play-piece b0.22 3 yellow-piece))
(define b0.24 (board-set-play-piece b0.23 3 red-piece))
(define b0.25 (board-set-play-piece b0.24 4 yellow-piece))
(define b0.26 (board-set-play-piece b0.25 4 yellow-piece))
(define b0.27 (board-set-play-piece b0.26 4 red-piece))
(define b0.28 (board-set-play-piece b0.27 4 red-piece))
(define b0.29 (board-set-play-piece b0.28 4 red-piece))
(define b0.30 (board-set-play-piece b0.29 4 yellow-piece))
(define b0.31 (board-set-play-piece b0.30 5 yellow-piece))
(define b0.32 (board-set-play-piece b0.31 5 red-piece))
(define b0.33 (board-set-play-piece b0.32 5 red-piece))
(define b0.34 (board-set-play-piece b0.33 5 yellow-piece))
(define b0.35 (board-set-play-piece b0.34 5 yellow-piece))
(define b0.36 (board-set-play-piece b0.35 5 red-piece))
(define b0.37 (board-set-play-piece b0.36 6 red-piece))
(define b0.38 (board-set-play-piece b0.37 6 yellow-piece))
(define b0.39 (board-set-play-piece b0.38 6 yellow-piece))
(define b0.40 (board-set-play-piece b0.39 6 red-piece))
(define b0.41 (board-set-play-piece b0.40 6 yellow-piece))
(define b0.42 (board-set-play-piece b0.41 6 red-piece))
(board-can-play? b0)
(board-can-play? b1)
(board-can-play? b0.42)

(board-set-play-piece b0 0 red-piece)
(board-set-play-piece b0 0 yellow-piece)
(board-set-play-piece b0 6 red-piece)


(define b1.1(board-set-play-piece b1 0 red-piece))
(define b1.2(board-set-play-piece b1.1 0 red-piece))
(define b1.3(board-set-play-piece b1.2 0 red-piece))
(define b1.4(board-set-play-piece b1.3 0 red-piece))
(define b2.1(board-set-play-piece b2 6 yellow-piece))
(define b2.2(board-set-play-piece b2.1 6 yellow-piece))
(define b2.3(board-set-play-piece b2.2 6 yellow-piece))
(define b2.4(board-set-play-piece b2.3 6 yellow-piece))
(board-check-vertical-win b0)
(board-check-vertical-win b1.4)
(board-check-vertical-win b2.4)


(define b4(board))
(define b5(board))
(define b4.1(board-set-play-piece b4 0 red-piece))
(define b4.2(board-set-play-piece b4.1 1 red-piece))
(define b4.3(board-set-play-piece b4.2 2 red-piece))
(define b4.4(board-set-play-piece b4.3 3 red-piece))
(define b5.1(board-set-play-piece b5 3 yellow-piece))
(define b5.2(board-set-play-piece b5.1 4 yellow-piece))
(define b5.3(board-set-play-piece b5.2 5 yellow-piece))
(define b5.4(board-set-play-piece b5.3 6 yellow-piece))
(board-check-horizontal-win b0)
(board-check-horizontal-win b4.4)
(board-check-horizontal-win b5.4)

(define b6(board))
(define b7(board))
(define b6.1(board-set-play-piece b6 0 red-piece))
(define b6.2(board-set-play-piece b6.1 1 yellow-piece))
(define b6.3(board-set-play-piece b6.2 1 red-piece))
(define b6.4(board-set-play-piece b6.3 2 yellow-piece))
(define b6.5(board-set-play-piece b6.4 2 yellow-piece))
(define b6.6(board-set-play-piece b6.5 2 red-piece))
(define b6.7(board-set-play-piece b6.6 3 yellow-piece))
(define b6.8(board-set-play-piece b6.7 3 yellow-piece))
(define b6.9(board-set-play-piece b6.8 3 yellow-piece))
(define b6.10(board-set-play-piece b6.9 3 red-piece))
(define b7.1(board-set-play-piece b7 3 yellow-piece))
(define b7.2(board-set-play-piece b7.1 4 yellow-piece))
(define b7.3(board-set-play-piece b7.2 5 yellow-piece))
(define b7.4(board-set-play-piece b7.3 6 yellow-piece))
(board-check-diagonal-win b0)
(board-check-diagonal-win b6.10)
(board-check-diagonal-win b5.4)

(board-who-is-winner b0)
(board-who-is-winner b4.4)
(board-who-is-winner b2.4)

(define g0(game p1 p2 b0 1))
(define g1(game p1 p3 b1 1))
(define g2(game p3 p2 b2 1))
g0
g1
g2

(define g(game p1 p2 b0 1))
(define g3(game p3 p1 b4.4 1))
(define g4(game p3 p2 b2.4 1))
(game-history g0)
(game-history g3)
(game-history g4)

(define g.e(game p1 p2 b0.42 1))
(game-is-draw? g.e)
(game-is-draw? g3)
(game-is-draw? g4)

(define p1.1(player-update-stats p1 "win"))
(define p1.2(player-update-stats p1.1 "loss"))
(define p1.3(player-update-stats p1.2 "draw"))
p1
p1.1
p1.2
p1.3

(game-get-current-player g)
(game-get-current-player g1)
(game-get-current-player g2)

(game-get-board g)
(game-get-board g3)
(game-get-board g4)

(define g.1(game-set-end g))
(define g3.1(game-set-end g3))
(define g4.1(game-set-end g4))
g.1
g3.1
g4.1

(define g.2(game-player-set-move g p1 0))
(define g3.2(game-player-set-move g1 p3 3))
(define g4.2(game-player-set-move g2 p2 6))
g.2
g3.2
g4.2

