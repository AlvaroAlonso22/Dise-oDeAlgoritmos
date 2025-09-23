#lang racket

(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))



:Con un intérprete de orden aplicativo, la expresión (test 0 (p)) nunca termina porque intenta evaluar (p)
:antes de entrar en la función, y (p) se llama a sí mismo sin fin.
:En cambio, con un intérprete de orden normal, los argumentos no se evalúan hasta
que hacen falta: la expresión se convierte en (if (= 0 0) 0 (p)), y como la condición es verdadera,
devuelve 0 sin llegar a evaluar (p).