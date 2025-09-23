#lang racket

; Exercise 1.9: Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc,
; which increments its argument by 1, and dec, which decrements its argument by 1.

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; Primera definición del procedimiento:
(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

; Modelo de sustitución para (plus 4 5) - Primer procedimiento:
; (plus 4 5)
; (inc (plus (dec 4) 5))
; (inc (plus 3 5))
; (inc (inc (plus (dec 3) 5)))
; (inc (inc (plus 2 5)))
; (inc (inc (inc (plus (dec 2) 5))))
; (inc (inc (inc (plus 1 5))))
; (inc (inc (inc (inc (plus (dec 1) 5)))))
; (inc (inc (inc (inc (plus 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; Segunda definición del procedimiento:
; (define (plus a b)
;   (if (= a 0)
;       b
;       (plus (dec a) (inc b))))

; Modelo de sustitución para (plus 4 5) - Segundo procedimiento:
; (plus 4 5)
; (plus (dec 4) (inc 5))
; (plus 3 6)
; (plus (dec 3) (inc 6))
; (plus 2 7)
; (plus (dec 2) (inc 7))
; (plus 1 8)
; (plus (dec 1) (inc 8))
; (plus 0 9)
; 9

; Análisis:
; El primer procedimiento genera un proceso RECURSIVO porque construye
; una cadena de operaciones inc diferidas que deben ejecutarse después
; de que retornen las llamadas recursivas. El proceso se expande y luego se contrae.

; El segundo procedimiento genera un proceso ITERATIVO porque el estado
; de la computación se captura completamente por los parámetros a y b
; en cada paso, sin operaciones diferidas. Cada llamada recursiva es
; una llamada de cola (tail call).

