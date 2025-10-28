#lang racket

;; Ejercicio 55, capítulo 2. 

;; To her surprise, the interpreter prints back quote. Explain.

(car ''abracadabra)

;; Explicación: "car" coge la primera expresión que encuentra, que en este caso, no es "abracadabra", sino " ' ", que se conoce como "quote".
;; Por esa sencilla razón, al ejecutarlo, muestra "quote".

