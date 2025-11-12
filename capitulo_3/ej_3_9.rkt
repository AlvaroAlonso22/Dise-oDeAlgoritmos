#lang racket
;Estructura (recursiva) paso a paso
;Tras cada llamada:
;R1: n=6, pendiente: (* 6 (factorial 5)).​
;R2: n=5, pendiente: (* 5 (factorial 4)).​
;R3: n=4, pendiente: (* 4 (factorial 3)).​
;R4: n=3, pendiente: (* 3 (factorial 2)).​
;R5: n=2, pendiente: (* 2 (factorial 1)).​
;R6: n=1, devuelve 1 desenrollado como se describe arriba hasta 720.​

;Estructura (iterativa) por estados
;I1: {product=1, counter=1, max-count=6}: llamada cola a (fact-iter (*1 1)=1, 2, 6).
;I2: {product=1, counter=2, max-count=6}: siguiente: (2, 3, 6).
;I3: {product=2, counter=3, max-count=6}: siguiente: (6, 4, 6).
;I4: {product=6, counter=4, max-count=6}: siguiente: (24, 5, 6).
;I5: {product=24, counter=5, max-count=6}: siguiente: (120, 6, 6).
;I6: {product=120, counter=6, max-count=6}: siguiente: (720, 7, 6).
;I7: {product=720, counter=7, max-count=6} cumple (> counter max-count) y devuelve 720.