#lang racket
(define (leer-fichero-listas-sin-indice ruta)
  (call-with-input-file ruta
    (lambda (in)
      (let loop ((linea (read-line in 'any))
                 (acumulador '()))
        (if (eof-object? linea)
            (reverse acumulador)
            (let* ((partes (string-split linea ":"))
                   (numeros-str (if (> (length partes) 1)
                                    (cadr partes)
                                    ""))
                   (numeros (filter number?
                                    (map string->number
                                         (string-split numeros-str))))
                   (ordenados (sort numeros <)))
              (loop (read-line in 'any) (cons ordenados acumulador))))))))

(define entrada (leer-fichero-listas-sin-indice "04_dat_01.txt"))

(define (Parcial-voraz datos)
  ; Complete todo el código que se necesite.
  ; Al final, debe devolver una lista de listas con las 
  ; habilidades de los individuos seleccionados.
  
  ;;Función auxiliar para sumar habilidades
  (define (suma lst)
    (if (null? lst)
        0
        (+ (car lst) (suma (cdr lst)))))

  ;;Función que obtiene el elemento con la mayor suma
  (define (maximo-por-suma lista)
    (if (null? lista)
        '()
        (let loop ((resto (cdr lista))
                   (mejor (car lista))
                   (max-suma (suma (car lista))))
          (if (null? resto)
              mejor
              (let* ((actual (car resto))
                     (s (suma actual)))
                (if (> s max-suma)
                    (loop (cdr resto) actual s)
                    (loop (cdr resto) mejor max-suma)))))))
    
   ;;Funcion que elimina la primera aparición de un elemento en la lista
  (define (eliminar elem lista)
    (cond
      ((null? lista) '())
      ((equal? (car lista) elem) (cdr lista))
      (else (cons (car lista) (eliminar elem (cdr lista))))))

  ;;Bucle principal voraz
  (let loop ((restantes datos)
             (seleccionados '()))
    (if (or (null? restantes)
            (= (length seleccionados) 20))
        (reverse seleccionados)
        (let* ((mejor (maximo-por-suma restantes))
               (nuevos-restantes (eliminar mejor restantes)))
          (loop nuevos-restantes (cons mejor seleccionados)))))
        
)

(length (Parcial-voraz entrada)) ; deberia devolver 20
