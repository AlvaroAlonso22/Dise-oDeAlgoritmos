#lang racket

(define (double f)
  (define (aplicar-dos-veces x)
    (f (f x)))
  aplicar-dos-veces)  ; devolvemos la función
