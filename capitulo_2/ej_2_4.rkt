#lang racket

; cons devuelve una funcion, dado m, lo aplica a x e y
; (cons x y) crea un paquete de x e y en forma de función
(define (cons x y)
  (lambda (m) (m x y)))


; car recibe un par z, que es una funcion creada por cons
; (lambda (p q) p) devuelve p dados p y q (el primer elemento)
(define (car z) 
  (z (lambda (p q) p)))

; cons crea un paquete y car abre el paquete devolviendo el primer elemento guardado


; cdr debe devolver el segundo elemento, similar a (car z)
(define (cdr z)
  (z (lambda (p q) q)))
