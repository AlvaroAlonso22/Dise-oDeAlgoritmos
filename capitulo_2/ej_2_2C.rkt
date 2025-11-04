#lang racket

(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

(define (bob-make-box x y w h)
  (attach-tag 'bob-box (list x y w h)))
 

(define (alice-make-box x1 y1 x2 y2)
  (attach-tag 'alice-box (list x1 y1 x2 y2)))
  

(define (width box)
  (cond
    ((eq? (type-tag box) 'bob-box)
     (list-ref (contents box) 2))    
    ((eq? (type-tag box) 'alice-box)
     (list-ref (contents box) 2))))




(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 2 4))

(width a) 
(width b) 
