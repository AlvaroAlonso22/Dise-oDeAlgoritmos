#lang racket

;; Ejercicio 3.16 – SICP, versión Racket con mcons/mpairs.

;; Definición original de Ben Bitdiddle para contar pares.
(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))


; 1) Estructura con exactamente 3 pares donde count-pairs devuelve 3.

;; Lista lineal normal de tres elementos: (a b c). 
(define s3
  (mcons 'a (mcons 'b (mcons 'c null))))

;; Diagrama de cajas y flechas (tres mpairs físicos)
;;
;; s3 ->
;;       [ * | * ] --> [ * | * ] --> [ * | / ]
;;         a           b              c




;; 2) Estructura con exactamente 3 pares donde count-pairs devuelve 4. ]

(define x4 (mcons 'a null))         

(define y4 (mcons x4 x4))          

(define s4 (mcons y4 null))      

;; Diagrama: 
;;
;; P1 = [ * | / ]
;;        a
;;
;; P2 = [ * | * ]
;;        |   |
;;        v   v
;;       P1  P1
;;
;; P3 = [ * | / ]
;;        |
;;        v
;;       P2
;;
;; s4 -> P3

;; 3) Estructura con exactamente 3 pares donde count-pairs devuelve 7.

(define x7 (mcons 'a null))         

(define y7 (mcons x7 x7))          

(define s7 (mcons y7 y7))         

;; Diagrama: 
;;
;; P1 = [ * | / ]
;;        a
;;
;; P2 = [ * | * ]
;;        |   |
;;        v   v
;;       P1  P1
;;
;; P3 = [ * | * ]
;;        |   |
;;        v   v
;;       P2  P2
;;
;; s7 -> P3


;; 4) Estructura con exactamente 3 pares donde count-pairs nunca termina. 

;; Creamos tres pares C1, C2, C3. 
(define a-inf (mcons 'a null))      
(define b-inf (mcons 'b null))       
(define c-inf (mcons 'c null))      

;; Enlazamos en ciclo: a -> b -> c -> a usando set-mcdr!.
(set-mcdr! a-inf b-inf)              
(set-mcdr! b-inf c-inf)            
(set-mcdr! c-inf a-inf)              

;; s-inf es el comienzo del ciclo. 
(define s-inf a-inf)

;; Diagrama del ciclo de tres pares: [
;;
;; C1 = [ * | * ]  -->  C2 = [ * | * ]  -->  C3 = [ * | * ]
;;        a              b                   c
;;         ^----------------------------------|
;;                    mcdr de C3 vuelve a C1
;;
;; s-inf -> C1
