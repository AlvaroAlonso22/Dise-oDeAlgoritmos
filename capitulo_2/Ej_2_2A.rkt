#lang racket

; Bob's box
(define (bob-make-box x y w h)
  (cons (cons x y) (cons w h)))

(define (bob-width box)
   (car (cdr box)))

(define (bob-height box)
   (cdr (cdr box)))

(define (bob-area box)
    (* (bob-width box) (bob-height box)))

; Alice's box
(define (alice-make-box x1 y1 x2 y2)
 (cons (cons x1 y1) (cons x2 y2)))

(define (alice-width box)
   (abs (- (car (cdr box))
           (car (car box)))))

(define (alice-height box)
   (abs (- (cdr (cdr box))
           (cdr (car box)))))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))

(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))

(alice-area a)

(bob-area b)

a

b

;Como dice en el ejercicioi el sceip funciona






