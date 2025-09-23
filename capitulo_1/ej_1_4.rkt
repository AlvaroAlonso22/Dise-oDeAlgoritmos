#lang racket

; Exercise 1.4:** Observe that our model of evaluation allows for
; combinations whose operators are compound expressions.  Use this
; observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; SOLUCIÓN:
; Este procedimiento demuestra que en Racket el operador de una combinación
; puede ser una expresión compuesta que se evalúa para determinar qué
; procedimiento aplicar.

; La evaluación funciona de la siguiente manera:

; CASO 1: Cuando b > 0
; - La condición (> b 0) evalúa a #t (verdadero)
; - La expresión (if (> b 0) + -) devuelve el operador +
; - La combinación completa se convierte en: (+ a b)
; - Resultado: a + b

; CASO 2: Cuando b ≤ 0
; - La condición (> b 0) evalúa a #f (falso)
; - La expresión (if (> b 0) + -) devuelve el operador -
; - La combinación completa se convierte en: (- a b)
; - Resultado: a - b

; FUNCIÓN MATEMÁTICA RESULTANTE:
; El procedimiento calcula a + |b| (a más el valor absoluto de b):
; - Si b es positivo: a + b = a + |b|
; - Si b es negativo: a - b = a + |b|

; CONCEPTO CLAVE:
; Este es un ejemplo elegante de cómo las funciones pueden ser tratadas
; como valores de primera clase que se seleccionan dinámicamente durante
; la evaluación. El operador no está fijo, sino que se determina mediante
; la evaluación de una expresión condicional.

; Ejemplos de uso:
; (a-plus-abs-b 3 4)   → 7  (porque 3 + 4 = 7)
; (a-plus-abs-b 3 -4)  → 7  (porque 3 - (-4) = 3 + 4 = 7)
; (a-plus-abs-b 5 2)   → 7  (porque 5 + 2 = 7)
; (a-plus-abs-b 5 -2)  → 7  (porque 5 - (-2) = 5 + 2 = 7)
