#lang racket
(define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (* b b) (/ n 2)))
          (else      (iter (* a b) b (- n 1)))))

(define (fast-expt2 b n)
  (iter 1 b n))
