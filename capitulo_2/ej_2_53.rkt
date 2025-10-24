#lang racket
;(list 'a 'b 'c) -> En este primer caso devuelve '(a b c) ya que se marcan como strings
;(list (list 'george)) -> devuelve '((george)) que es una lista que contiene a una lista que a su vez contiene el string 'george
;(cdr '((x1 x2) (y1 y2))) cdr devuelve una lista de la segunda parte del string, como (y1 y2) es una lista, devuelve una lista
;que contiene esta lista: '((y1 y2))
;(cadr '((x1 x2) (y1 y2))) -> Es car (cdr (args)) -> car((y1 y2)) donde se devuelve el primer elemento de la lista -> (y1 , y2). En
;este caso no se devuelve una lista dentro de una lista
;(pair? (car '(a short list))) -> Devuelve False porque car no aparece dentro de la lista
;(memq 'red '((red shoes) (blue socks))) -> Devuelve false porque red es diferente a la lista (red shoes)
;(memq 'red '(red shoes blue socks)) -> Devuelve '(red shoes blue socks) porque devuelve a partir del valor encontrado