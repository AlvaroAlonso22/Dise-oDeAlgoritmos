#lang racket

(define (for-each proc items)
  (if (null? items) ; Si la lista está vacía
      0
      (begin
        (proc (car items))        ; aplica el procedimiento al primer elemento
        (for-each proc (cdr items))))) ; recorre el resto


;; Ejemplo de entrada (for-each (lambda (x) (newline) (display x))(list 57 321 88))