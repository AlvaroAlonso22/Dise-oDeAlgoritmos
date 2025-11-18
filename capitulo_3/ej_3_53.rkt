#lang racket
;El stream comienza en 1, y puesto que el resto se define como la suma del
;stream consigo mismo, cada nuevo elemento es el doble del anterior. Por lo tanto,
;los elementos del stream son 1, 2, 4, 8, 16, 32, 64…, es decir, las potencias de 2