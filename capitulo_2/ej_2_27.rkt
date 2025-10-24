#lang racket

(define (deep-reverse lst)
  (if (null? lst)
      '() ; caso base: lista vacía
      (append (deep-reverse (cdr lst))
              (list (if (list? (car lst))
                        (deep-reverse (car lst)) ; si es sublista, invertirla recursivamente
                        (car lst))))))           ; si no, dejar el elemento igual


(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)
