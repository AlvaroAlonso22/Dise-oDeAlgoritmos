#lang racket

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;El programa entra en recursión infinita y nunca termina,
;porque en new-if se evalúan todas las ramas antes de aplicarse,
;mientras que el if especial solo evalúa la rama necesaria.