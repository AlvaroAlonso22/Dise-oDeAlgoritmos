#lang racket

; Representación del grafo no dirigido.
; Los vértices representan las plantas y las aristas conectan parejas de nodos.
; El número de aristas representa el número de escaleras que conectan las plantas.
;
;    3O     3E
;    ||     ||
;    2O     2E
;     \\   //
;        1
;     |||||||
;        0
;
; ¿SE PUEDE RECORRER TODOS LOS TRAMOS (aristas) EN UN TRAYECTO SIN REPETIR?
;
; Se pueden recorrer todas las aristas en un recorrido sin importar desde dónde
; se empiece y sin recorrer la misma arista más de una vez, pero no se puede empezar
; desde cualquier vértice, solo se puede desde el "1" y "0", ya que es imposible
; comenzando desde "3O" y "3E" no se puede por el número impar de aristas desde "1" y "0"
; ya que o bien se queda atascado en "0" o nunca lo llega a explorar. Desde "2O" y
; "2E" no se puede tampoco por el mismo motivo,