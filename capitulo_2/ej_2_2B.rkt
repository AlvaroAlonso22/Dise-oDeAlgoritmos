#lang racket
  ;; Alice version tag
(define (alice-make-box w h x y)
  (cons 'alice-box               
        (cons (cons w h)           
              (cons x y))))        


(define (alice-area box)
  (let ((pair (cadr box)))
    (cdr pair))) 

;; Bob version  tag
(define (bob-make-box w h x y)
  (cons 'bob-box
        (cons (cons w h)
              (cons x y))))


(define (bob-area box)
  (let ((pair (cadr box)))
    (* (car pair) (cdr pair))))  

