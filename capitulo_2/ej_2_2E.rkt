#lang racket
(define (attach-tag tag contents) (cons tag contents))
(define (type-tag x) (car x))
(define (contents x) (cdr x))

(define (bob-make-box x y w h) (attach-tag 'bob-box (cons (cons x y) (cons w h))))
(define (bob-width b)  (car (cdr (contents b))))
(define (bob-height b) (cdr (cdr (contents b))))
(define (bob-area b)   (* (bob-width b) (bob-height b)))

(define (alice-make-box x1 y1 x2 y2) (attach-tag 'alice-box (cons (cons x1 y1) (cons x2 y2))))
(define (alice-width a)  (abs (- (car (cdr (contents a))) (car (car (contents a))))))
(define (alice-height a) (abs (- (cdr (cdr (contents a))) (cdr (car (contents a))))))
(define (alice-area a)   (* (alice-width a) (alice-height a)))

(define registry (make-hash))
(define (register op tag f) (hash-set! registry (list op tag) f))
(define (lookup op tag) (hash-ref registry (list op tag) (λ () (error "No impl" op tag))))

(register 'width  'bob-box   bob-width)
(register 'height 'bob-box   bob-height)
(register 'area   'bob-box   bob-area)
(register 'width  'alice-box alice-width)
(register 'height 'alice-box alice-height)
(register 'area   'alice-box alice-area)

(define (width  box) ((lookup 'width  (type-tag box)) box))
(define (height box) ((lookup 'height (type-tag box)) box))
(define (area   box) ((lookup 'area   (type-tag box)) box))

;; Prueba rápida
(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box   1 2 3 4))
(list 'a (width a) (height a) (area a))
(list 'b (width b) (height b) (area b))
