#lang racket
(define (cons a b)
  (* (expt 2 a) (expt 3 b))) ;calcula los exponentes

(define (car z)
  (define (iter n count)
    (if (= (remainder n 2) 0)
        (iter (/ n 2) (+ count 1)) ;car cuenta cuantos factores de 2 tiene el numero
        count))
  (iter z 0))

(define (cdr z)
  (define (iter n count)
    (if (= (remainder n 3) 0)
        (iter (/ n 3) (+ count 1)) ;cdr cuenta cuantos factores de 3 tiene el numero
        count))
  (iter z 0))

(define p (cons 2 1))
p
(car p)
(cdr p)