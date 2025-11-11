#lang racket
(define (make-accumulator initial)
  (let ((sum initial))
    (lambda (n)
      (set! sum (+ sum n))
      sum)))

(define A (make-accumulator 5))
(A 10) ;devuelve 15
(A 10) ;devuelve 25