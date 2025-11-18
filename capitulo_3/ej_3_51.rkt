#lang racket


;Streams 

(define-syntax cons-stream
  (syntax-rules ()
    [(_ a b) (cons a (delay b))]))

(define the-empty-stream '())

(define (stream-null? s)
  (null? s))

(define (stream-car s)
  (car s))

(define (stream-cdr s)
  (force (cdr s)))

; stream-map
(define (stream-map f s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream
       (f (stream-car s))
       (stream-map f (stream-cdr s)))))

; stream-ref
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (sub1 n))))

; stream-enumerate-interval
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (add1 low) high))))

; display-line y show
(define (display-line x)
  (display x)
  (newline))

(define (show x)
  (display-line x)
  x)




(define x
  (stream-map
   show
   (stream-enumerate-interval 0 10)))

(stream-ref x 5) ;aqui muestra los numeros del 0-5
(stream-ref x 7) ; en este muestra solo los nuevos que son 6 y 7
