#lang racket

(define (make-monitored f) ;recibe f (un procedimiento a monitorizar)
  (let ((count 0)) ;crea una variable local count para llevar la cuenta de las llamadas, inicializada en 0
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) count) ;Si x es 'how-many-calls?, devuelve el contador
            ((eq? x 'reset-count) (set! count 0)) ;Si x es 'reset-count, reinicia el contador a 0
            (else (set! count (+ count 1)) ;Para cualquier otra entrada devulve el contador
                  (f x)))))) ;Llama el procedimiento original f con entrada x

(define s (make-monitored sqrt))

(s 100) ;devuelve 10

(s 'how-many-calls?) ;deveulve 1