#lang racket
;Celda global para detectar el orden
(define flag #f)

;f: marca la primera llamada y devuelve 0/1 según el estado previo
(define (f x)
  (if flag
      1               ; si ya estaba marcada, devuelve 1
      (begin
        (set! flag #t) ; marca en la primera visita
        0))); y devuelve 0 en esa primera


(define (plus-rl a b)
  (let ((right b)     ; fuerza evaluar b primero
        (left  a))    ; luego a
    (+ left right)))

(set! flag #f)
(plus-rl (f 0) (f 1))  ; 1