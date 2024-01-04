#lang racket

(provide atom?)

(define (atom? s)
  (not (list? s)))

; Every lat is a list of atoms
(define lat?
  (λ (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
(lat? '(Jack Sprat could eat no chicken fat))
(lat? '(bacon and eggs))
(null? (cdr '(eggs)))

; else is a question whose value is always true

(define (member? a lat)
  (cond
    ((null? lat) #f)
    (else (or (eq? (car lat) a)
              (member? a (cdr lat))))))

(member? 'tea '(coffee tea or milk))
(member? 'poached '(fried eggs and scrambled eggs))

; The First Commandment (preliminary):
; Always ask null? as the first question in expressing any function.
