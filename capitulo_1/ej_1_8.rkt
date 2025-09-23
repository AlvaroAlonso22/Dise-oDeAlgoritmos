#lang racket
(define (cubo x)
  (* x x x))

(define (raiz_cubo aproximacion x)
  (if (buena_aproximacion aproximacion x)
      aproximacion
      (raiz_cubo(mejorar aproximacion x) x)))

(define (buena_aproximacion aproximacion x)
  (< (abs(-(cubo aproximacion) x))0.001))


(define (mejorar aproximacion x)
  (/ (+ (/ x (* aproximacion aproximacion)) (* 2 aproximacion)) 3))


(raiz_cubo 1.0 125)