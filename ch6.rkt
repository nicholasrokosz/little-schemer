#lang racket

(require "ch2.rkt")

#|(define (numbered? aexp)
  (cond
    ((null? aexp) #t)
    ((atom? aexp) (or (number? aexp) (eq? '+ aexp)
                   (eq? 'expt aexp) (eq? '* aexp)))
    (else (and (numbered? (car aexp))
               (numbered? (cdr aexp))))))|#

#|(define (numbered? aexp)
  (cond
    ((atom? aexp) (number? s))
    ((eq? (car (cdr aexp)) '+) (and ))
    ((eq? (car (cdr aexp)) '*) )
    ((eq? (car (cdr aexp)) 'expt) ))) ; (eq? (car (cdr aexp)) 'expt)|#

(define (numbered? aexp)
  (cond
    ((atom? aexp) (number? aexp))
    (else (and (numbered? (car aexp))
               (numbered? (car (cdr (cdr (aexp)))))))))

(println "------------------")
(numbered? 1)
(numbered? '(3 + (4 expt 5)))
(numbered? '(2 * sausage))


#|(define (value nexp)
  (cond
    ((atom? nexp) nexp)
    ((eq? (car nexp) '+) (+ (value (car (cdr nexp))) (value (car (cdr (cdr nexp))))))
    ((eq? (car nexp) '*) (* (value (car (cdr nexp))) (value (car (cdr (cdr nexp))))))
    (else (expt (value (car (cdr nexp))) (value (car (cdr (cdr nexp))))))))|#


(define (1st-sub-exp aexp)
  (car (cdr aexp)))


(define (2nd-sub-exp aexp)
  (car (cdr (cdr aexp))))


(define (operator aexp)
  (car (aexp)))


(define (value nexp)
  (cond
    ((atom? nexp) nexp)
    ((eq? (operator nexp) '+) (+ (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
    ((eq? (operator nexp) '*) (* (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
    (else (expt (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))))


(define (sero? n)
  (null? n))


(define (edd1 n)
  (cons '() n))


(define (zub1 n)
  (cdr n))


(define (oo+ n m)
  (cond
    ((sero? m) n)
    (else (edd1 (oo+ n (zub1 m))))))






































































































