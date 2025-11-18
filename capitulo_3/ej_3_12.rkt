#lang racket

;; Exercise 3.12: What are the missing ⟨response⟩s? Draw box-and-pointer diagrams to explain your answer.


(define x (mcons 'a (mcons 'b null)))
(define y (mcons 'c (mcons 'd null)))
(define z (append x y))

z
(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(cdr x)
(mcons 'b '())

(define w (append! x y))

w
(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(cdr x)
(mcons 'b (mcons 'c (mcons 'd '())))

#|
Explicación:

Estructura de listal al comienzo:
x:
   +-----+-----+      +-----+-----+
   |  a  |  o-------->|  b  |  /  |
   +-----+-----+      +-----+-----+

y:
   +-----+-----+      +-----+-----+
   |  c  |  o-------->|  d  |  /  |
   +-----+-----+      +-----+-----+


Si usamos append, construye una lista nueva copiando los pares de x con mcons
y enganchándolos por delante de y, sin modificar ni x ni y:

z:
   +-----+-----+      +-----+-----+      +-----+-----+      +-----+-----+
   |  a  |  o-------->|  b  |  o-------->|  c  |  o-------->|  d  |  /  |
   +-----+-----+      +-----+-----+      +-----+-----+      +-----+-----+

x (sin cambios):
   +-----+-----+      +-----+-----+
   |  a  |  o-------->|  b  |  /  |
   +-----+-----+      +-----+-----+

y (sin cambios):
   +-----+-----+      +-----+-----+
   |  c  |  o-------->|  d  |  /  |
   +-----+-----+      +-----+-----+

si usamos append!, la lista de x es (a b c d), porque el mcdr del par de 'b
se ha mutado para apuntar al primer par de y:

x, w:
   +-----+-----+      +-----+-----+      +-----+-----+      +-----+-----+
   |  a  |  o-------->|  b  |  o-------->|  c  |  o-------->|  d  |  /  |
   +-----+-----+      +-----+-----+      +-----+-----+      +-----+-----+

y (los mismos pares, ahora compartidos):
   ^                         ^
   |_________________________|
   (y apunta al par de 'c)


|#
