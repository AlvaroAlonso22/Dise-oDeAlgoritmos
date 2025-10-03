#lang racket

(define (constructor-rat numerador denominador)
  (cond
    ;; Caso ambos negativos: quitar los signos
    ((and (< numerador 0) (< denominador 0))
     (cons (- numerador) (- denominador)))
    ;; Caso denominador negativo: pasar el signo al numerador
    ((< denominador 0)
     (cons (- numerador) (- denominador)))
    ;; Caso normal
    (else
     (cons numerador denominador))))
(define (numerador rat)
  (car rat))
(define (denominador rat)
  (cdr rat))
(define (+rat x y)
  (constructor-rat (+ (* (numerador x) (denominador y)) (*(denominador x) (numerador y)))
                   (* (denominador x) (denominador y))))

(define un-tercio (constructor-rat 1 3))
(define dos-tercios (+rat  un-tercio un-tercio))
