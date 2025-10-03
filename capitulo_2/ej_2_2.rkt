#lang racket
;; Constructor y selectores para puntos
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


;; Constructor y selectores para segmentos
(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))


;; Calcular el punto medio de un segmento
(define (midpoint-segment s)
  (let* ((p1 (start-segment s))
         (p2 (end-segment s))
         (mx (/ (+ (x-point p1) (x-point p2)) 2))
         (my (/ (+ (y-point p1) (y-point p2)) 2)))
    (make-point mx my)))


;; Función para imprimir puntos
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


;; Ejemplo de uso:
(define p1 (make-point 2 4))
(define p2 (make-point 8 10))
(define s (make-segment p1 p2))

(print-point (midpoint-segment s)) ; → (5,7)
