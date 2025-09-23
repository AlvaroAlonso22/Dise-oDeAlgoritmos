#lang racket

;1. Show that sum and product are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
;2. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

; Versión recursiva: proceso recursivo lineal
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value
                            term (next a) next b))))

; sum y product como casos particulares
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

; Versión iterativa: proceso iterativo en espacio constante
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

; sum-iter y product-iter usando la versión iterativa
(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))
