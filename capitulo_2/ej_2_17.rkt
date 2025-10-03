#lang racket
(define (last-pair lst)
  (if (null? (cdr lst))   ; si ya estamos en el último elemento
      lst                 ; devolvemos la lista con ese único elemento
      (last-pair (cdr lst))))


(last-pair (list 3 2 1 5))