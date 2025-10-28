#lang racket
(define (equal-simbolos? a b)
  (cond
    ((and (symbol? a) (symbol? b)) (eq? a b))   ; ambos símbolos
    ((and (pair? a) (pair? b))                   ; ambos listas
     (and (equal-simbolos? (car a) (car b))
          (equal-simbolos? (cdr a) (cdr b))))
    ((and (null? a) (null? b)) #t)              ; ambos vacíos
    (else #f)))                                 ; caso contrario, no son iguales

(equal-simbolos? '(this is a list) '(this is a list))
; => #t

(equal-simbolos? '(this is a list) '(this (is a) list))
; => #f


(define (equal? a b)
  (cond
    ((and (number? a) (number? b)) (= a b))     ; ambos números
    ((and (symbol? a) (symbol? b)) (eq? a b))  ; ambos símbolos
    ((and (pair? a) (pair? b))                  ; ambos listas
     (and (equal? (car a) (car b))
          (equal? (cdr a) (cdr b))))
    ((and (null? a) (null? b)) #t)             ; ambos vacíos
    (else #f)))                                ; caso contrario, no son iguales


(equal? '(a 1 b) '(a 1 b))
; => #t

(equal? '(a 1 b) '(a 2 b))
; => #f

(equal? '(x y z) '(x y z))
; => #t

(equal? '(x y z) '(x (y) z))
; => #f
