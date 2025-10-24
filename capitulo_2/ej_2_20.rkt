#lang racket

(define (same-parity x . y)
  (define (aux lst)
    (cond ((null? lst) '())
          ((= (remainder (car lst) 2) (remainder x 2))
           (cons (car lst) (aux (cdr lst))))
          (else (aux (cdr lst)))))
  (cons x (aux y)))

(same-parity 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)

(same-parity 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)