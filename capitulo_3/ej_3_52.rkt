#lang racket

;; ============================================================
;;      Sistema completo de streams estilo SICP
;;      con delay/force y memoización (como en el libro)
;; ============================================================

(define (memo-proc proc)
  (let ([already? #f]
        [val #f])
    (lambda ()
      (unless already?
        (set! val (proc))
        (set! already? #t))
      val)))

(define-syntax delay
  (syntax-rules ()
    [(_ exp)
     (memo-proc (lambda () exp))]))

(define (force delayed)
  (delayed))

(define-syntax cons-stream
  (syntax-rules ()
    [(_ a b)
     (cons a (delay b))]))

(define the-empty-stream '())

(define (stream-null? s)
  (null? s))

(define (stream-car s)
  (car s))

(define (stream-cdr s)
  (force (cdr s)))

;; stream-map
(define (stream-map f s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream
       (f (stream-car s))
       (stream-map f (stream-cdr s)))))

;; stream-filter
(define (stream-filter pred s)
  (cond [(stream-null? s) the-empty-stream]
        [(pred (stream-car s))
         (cons-stream
          (stream-car s)
          (stream-filter pred (stream-cdr s)))]
        [else
         (stream-filter pred (stream-cdr s))]))

;; stream-ref
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (sub1 n))))

;; stream-enumerate-interval  <-- IMPORTANTE: ahora está arriba
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (add1 low) high))))

;; display helpers
(define (display-line x)
  (display x)
  (newline))

(define (display-stream s)
  (unless (stream-null? s)
    (display-line (stream-car s))
    (display-stream (stream-cdr s))))

;; ============================================================
;;                    Exercise 3.52
;; ============================================================

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq
  (stream-map
   accum
   (stream-enumerate-interval 1 20)))

(define y
  (stream-filter even? seq))

(define z
  (stream-filter
   (lambda (x) (= (remainder x 5) 0))
   seq))

(stream-ref y 7)
(display-stream z)


;Después de definir seq, el valor de sum sigue siendo 0 porque ningún elemento del stream ha sido
;forzado todavía. Al evaluar (stream-ref y 7), se generan los primeros 15 valores de seq para obtener
;los ocho valores pares necesarios, por lo que sum pasa a valer 136. Luego, al evaluar (display-stream z),
;se fuerzan todos los elementos restantes del intervalo hasta 20, y sum alcanza su valor final de 210.
;La salida impresa consiste en los ocho valores pares acumulados producidos por (stream-ref y 7) y los
;valores acumulados múltiplos de 5 producidos por (display-stream z). Si delay se implementara simplemente
;como (lambda () exp) sin memoización, cada acceso al stream volvería a recalcular sus elementos, ejecutando
;accum muchas más veces, produciendo valores de sum mucho mayores y repitiendo impresiones; por tanto, los resultados
;serían distintos porque sin memoización cada elemento del stream no se almacena y se recomputa cada vez.
