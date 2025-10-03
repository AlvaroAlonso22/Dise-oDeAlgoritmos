#lang racket
(define (reverse lst)
  (if (null? lst)          ;Si la lista está vacía
      '()
      (append (reverse (cdr lst)) (list (car lst)))))


(reverse (list 1 4 9 16 25))

