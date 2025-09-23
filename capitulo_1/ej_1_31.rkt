#lang racket

;; Exercise 1.31: Product Procedure

; Procedimiento para incrementar en 1
(define (inc n) (+ n 1))

; Procedimiento identidad
(define (identity x) x)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))



; Factorial usando la versión recursiva
(define (factorial n)
  (product identity 1 inc n))

; Factorial usando la versión iterativa
(define (factorial-iter n)
  (product-iter identity 1 inc n))

; Función para el término de la serie de Wallis
; π/4 = (2*4*4*6*6*8*...) / (3*3*5*5*7*7*...)
(define (wallis-term k)
  (/ (* 4.0 k k)
     (* (- (* 2 k) 1) (+ (* 2 k) 1))))

; Aproximación de π usando product recursivo
(define (pi-wallis n)
  (product wallis-term 1 inc n))

; Aproximación de π usando product iterativo
(define (pi-wallis-iter n)
  (product-iter wallis-term 1 inc n))

