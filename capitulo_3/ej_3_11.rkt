#lang racket

;; Exercise 3.11: Will discuss as a group. In 3.2.3 we saw how
;; the environment model described the behavior of procedures with local state...

;; Código del ejercicio
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch)

;; Interacciones pedidas
(define acc (make-account 50))
((acc 'deposit) 40)
((acc 'withdraw) 60)

(define acc2 (make-account 100))

#|

- Where is the local state for acc kept? Suppose we define another account.

El estado local de acc es la variable balance almacenada en el frame (entorno) que
se crea al evaluar la llamada (make-account 50), y ese frame es el entorno al que apuntan
las clausuras withdraw, deposit y dispatch que forman.

- How are the local states for the two accounts kept distinct? Which parts of the environment
 structure are shared between acc and acc2?

Los estados locales de las dos cuentas se mantienen distintos porque cada llamada a make-account
crea un nuevo frame con su propio binding de balance (uno para acc, otro para acc2), y las clausuras
de cada cuenta capturan su propio frame, de modo que las operaciones sobre acc sólo modifican el
balance de su frame y las operaciones sobre acc2 sólo modifican el suyo.

Lo que comparten acc y acc2 es el entorno global (donde está definido make-account y residen los
procedimientos primitivos) y el código de los procedimientos make-account, withdraw, deposit y
dispatch; lo que no comparten son los frames concretos que contienen sus variables balance, que
son distintos para acc y para acc2.

|#
