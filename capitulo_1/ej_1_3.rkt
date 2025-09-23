#lang racket
(define (cuadrado x)
  (* x x))

(define (sum x y)
  (+ (cuadrado x) (cuadrado y)))

(define (sum_mayor a b c)
  (cond ((and (<= a b) (<= a c)) (sum b c)) ; 
        ((and (<= b a) (<= b c)) (sum a c)) ; 
        (else (sum a b))))                  ; 
    