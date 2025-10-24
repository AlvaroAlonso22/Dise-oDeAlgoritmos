#lang racket

; answer inserta los elementos de forma inversa:
;     para un input (1 2 3), en cada iteración se añaden a answers de la manera
;     answer(1) -> answer(2 1) -> answer(3 2 1)

; Usar cons no lo arregla porque cambia la estructura de datos, el segundo
; argumento debe ser una lista para poder devolver una lista, lo que no se cumple
; en su segunda implementación

; Una solución es cambiar:

;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things)
;              (cons (square (car things))
;                    answer))))
;  (iter items nil))

; Por:

;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)   
;        (reverse answer)  <---- 
;        (iter (cdr things)
;              (cons (square (car things))
;                    answer))))
;  (iter items nil)