#lang racket

;; --- Bob ---
(define (bob-make-box x y w h)
  (define (width) w)
  (define (height) h)
  (define (area) (* w h))
  (define (dispatch msg)
    (cond [(eq? msg 'width)  (width)]
          [(eq? msg 'height) (height)]
          [(eq? msg 'area)   (area)]
          [else (error "Mensaje desconocido" msg)]))
  dispatch)

;; --- Alice ---
(define (alice-make-box x1 y1 x2 y2)
  (define (width)  (abs (- x2 x1)))
  (define (height) (abs (- y2 y1)))
  (define (area)   (* (width) (height)))
  (define (dispatch msg)
    (cond [(eq? msg 'width)  (width)]
          [(eq? msg 'height) (height)]
          [(eq? msg 'area)   (area)]
          [else (error "Mensaje desconocido" msg)]))
  dispatch)

;; --- Operaciones genéricas ---
(define (width  box) (box 'width))
(define (height box) (box 'height))
(define (area   box) (box 'area))

;; --- Pruebas ---
(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box   1 2 3 4))

(list 'a (width a) (height a) (area a))
(list 'b (width b) (height b) (area b))
