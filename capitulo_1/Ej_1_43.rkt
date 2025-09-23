#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) 
      f ;n=1 la funcion 1 vez
      (compose f (repeated f (- n 1))))) ; si no, llevamos la cuenta hasta la enésima vez
