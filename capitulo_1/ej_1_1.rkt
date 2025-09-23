#lang racket

10 ; Es un literal

(+ 5 3 4) ; 5+3+4 = 12

(- 9 1) ;  9-1 = 8

(/ 6 2) ; 6/2 = 3

(+ (* 2 4) (- 4 6)) ;-> (+8 (-4 6)) -> (+ 8 -2) -> 6 

(define a 3) ; Define a como 3

(define b (+ a 1)) ; (define b (+ 3 1))-> (define b 4) -> Define b como 4

(+ a b (* a b)) ; (+ 3 4 (12)) -> (+ 7 12) -> 19

(= a b) ; a es distinto de b. 3!=4. Devuelve falso (#f)

(if (and (> b a) (< b (* a b))) ; 1ªcondicion (4 > 3) es true. 2ªcondicion (4 < 12) es true. Devuelve b que es 4
    b
    a)
    
(cond ((= a 4) 6) ; 3 != 4, False
      ((= b 4) (+ 6 7 a)) ; b = 4, True. Devuelve 6+7+3 = 16
      (else 25))
      
(+ 2 (if (> b a) b a)) ; 4 > 3, True. Devuelve b+2 = 4+2=6

(* (cond ((> a b) a) ; 3 es menor que 4, False.
         ((< a b) b) ; 3 es menor que 4, True. Nos quedmaos con la b=4.
         (else -1))
   (+ a 1)) ; b*(a+1) = 4 * 4 = 16. Devuelve 16