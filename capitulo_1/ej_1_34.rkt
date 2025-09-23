#lang racket
(define (f g) (g 2))

;What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)`?  Explain.

;Al llamar (f f), el parámetro g de f es la propia función f
(f f)
;(f 2) porque (f g) = (g 2) y aquí g = f
;Ahora f espera como argumento una función, pero le pasamos el número 2
;(f 2)
;(2 2) porque (f g) = (g 2) y ahora g = 2


;f espera un procedimiento como argumento, pero cuando aplicamos f a sí mismo, terminamos intentando usar un número como procedimiento, lo cual falla
;La expresión (2 2) intenta llamar al número 2 como si fuera una función