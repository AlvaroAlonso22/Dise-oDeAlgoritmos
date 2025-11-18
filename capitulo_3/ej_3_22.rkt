#lang racket

;; Exercise 3.22: Complete the definition of make-queue and provide
;; implementations of the queue operations using this representation.


(define (make-queue)
  (let ((front-ptr null)   
        (rear-ptr null))  

    (define (empty?)
      (null? front-ptr))

    (define (front)
      (if (empty?)
          (error "FRONT called with an empty queue")
          (mcar front-ptr)))

    (define (insert! item)
      (let ((new-pair (mcons item null)))
        (if (empty?)
            (begin
              (set! front-ptr new-pair)
              (set! rear-ptr new-pair))
            (begin
              (set-mcdr! rear-ptr new-pair)
              (set! rear-ptr new-pair)))))

    (define (delete!)
      (cond ((empty?)
             (error "DELETE! called with an empty queue"))
            (else
             (set! front-ptr (mcdr front-ptr)))))

    (define (dispatch m)
      (cond ((eq? m 'empty?)  empty?)
            ((eq? m 'front)   front)
            ((eq? m 'insert!) insert!)
            ((eq? m 'delete!) delete!)
            (else (error "Unknown operation -- QUEUE" m))))

    dispatch))


;; Predicado: ¿cola vacía?
(define (empty-queue? q)
  ((q 'empty?)))

;; Selector: elemento del frente
(define (front-queue q)
  ((q 'front)))

;; Mutador: insertar al final, devuelve la misma cola
(define (insert-queue! q item)
  ((q 'insert!) item)
  q)

;; Mutador: eliminar del frente, devuelve la misma cola
(define (delete-queue! q)
  ((q 'delete!))
  q)
