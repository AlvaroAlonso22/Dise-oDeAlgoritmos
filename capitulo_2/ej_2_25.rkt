#lang racket

;;Give combinations of `car`s and `cdr`s that will pick 7 from each of the following lists:
;;(1 3 (5 7) 9)
;;((7))
;;(1 (2 (3 (4 (5 (6 7))))))

;;;;;;;;;;;Para la primera lista:

;1 → primer elemento
;3 → segundo elemento
;(5 7) → tercer elemento (contiene el 7)
;9 → cuarto elemento

;Para obtener (5 7), usamos (car (cdr (cdr lista)))
;Para obtener 7 de (5 7), usamos cadr (o car tras cdr)
;Solución: (cadr (caddr lista))



;;;;;;;;;;;Para la segunda lista:

;La lista tiene un solo elemento: (7)
;Para obtener 7, tomamos el car del primer elemento:
;Solución: (car (car lista))


;;;;;;;;;;;Para la tercera lista:

;(cadr lista) = (2 (3 (4 (5 (6 7)))))
;(cadr ...) = (3 (4 (5 (6 7))))
;(cadr ...) = (4 (5 (6 7)))
;(cadr ...) = (5 (6 7))
;(cadr ...) = (6 7)
;(cadr ...) = 7
;Solución: (cadr (cadr (cadr (cadr (cadr (cadr lista))))))