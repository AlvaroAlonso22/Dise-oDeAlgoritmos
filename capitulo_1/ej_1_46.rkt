#lang racket
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let ((next-guess (improve guess)))
      (if (good-enough? guess next-guess)
          next-guess
          ((iterative-improve good-enough? improve) next-guess)))))


(define (sqrt x)
  (define (good-enough? guess next-guess)
    (< (abs (- guess next-guess)) 0.001))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (average a b)
    (/ (+ a b) 2))
  
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (good-enough? guess next-guess)
    (< (abs (- guess next-guess)) 0.00001))
  
  (define (improve guess)
    (f guess))
  
  ((iterative-improve good-enough? improve) first-guess))

;sin el metodo iterative-improve cada vez que se quiere resolver un problema iterativo, se tendría que volver a escribir un bucle recursivo similar
;con el metodo iterative-improve defino solo una vez el esqueleto del proceso iterativo, y lo unico que cambio es good-enough? y improve

(sqrt 9)
(fixed-point cos 1.0)


