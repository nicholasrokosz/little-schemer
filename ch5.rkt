#lang racket

(require "ch2.rkt")
(require "ch4.rkt")

(define (rember* a l)
  (cond
    ((null? l) '())
    ((eq? (car l) a) (rember* a (cdr l)))
    ((atom? (car l)) (cons (car l) (rember* a (cdr l))))
    (else (cons (rember* a (car l)) (rember* a (cdr l))))))

(rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)) ; ((coffee) ((tea)) (and (hick)))
(rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))


(define (insertR* new old l)
  (cond
    ((null? l) '())
    ((eq? (car l) old)
     (cons old (cons new (insertR* new old (cdr l)))))
    ((atom? (car l))
     (cons (car l) (insertR* new old (cdr l))))
    (else
     (cons (insertR* new old (car l)) (insertR* new old (cdr l))))))

(insertR* 'roast 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood))


(define (occur* a l)
  (cond
    ((null? l) 0)
    ((eq? (car l) a) (add1 (occur* a (cdr l))))
    ((atom? (car l)) (occur* a (cdr l)))
    (else (+ (occur* a (car l)) (occur* a (cdr l))))))

(occur* 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbert)) (banana) (bread) (banana brandy)))


(define (subst* new old l)
  (cond
    ((null? l) '())
    ((eq? (car l) old) (cons new (subst* new old (cdr l))))
    ((atom? (car l)) (cons (car l) (subst* new old (cdr l))))
    (else (cons (subst* new old (car l)) (subst* new old (cdr l))))))

(subst* 'orange 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbert)) (banana) (bread) (banana brandy)))


; is this wrong? see pg 95
(define (insertL* new old l)
  (cond
    ((null? l) '())
    ((eq? (car l) old) (cons new (cons old (insertL* new old (cdr l)))))
    ((atom? (car l)) (cons (car l) (insertL* new old (cdr l))))
    (else (cons (insertL* new old (car l)) (insertL* new old (cdr l))))))

(insertL* 'pecker 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood))


(define (member* a l)
  (cond
    ((null? l) #f)
    ((atom? (car l))
     (or (eq? (car l) a)
         (member* a (cdr l))))
    (else
     (or (member* a (car l))
         (member* a (cdr l))))))

(member* 'chips '((potato) (chips ((with) fish) (chips))))


(define (leftmost l)
  (cond
    ((atom? (car l)) (car l))
    (else (leftmost (car l)))))

(leftmost '((potato) (chips ((with) fish) (chips))))
(leftmost '(((hot) (tuna (and))) cheese))


; original definition
#|(define (eqlist? l1 l2)
   (cond
     ((and (null? l1)
           (null? l2)) #t)
     ((and (null? (car l1))
           (null? (car l2)))
      (eqlist? (cdr l1) (cdr l2)))
     ((and (atom? (car l1))
           (atom? (car l2)))
      (and (eqan? (car l1) (car l2))
           (eqlist? (cdr l1) (cdr l2))))
     ((and (list? (car l1))
           (list? (car l2)))
      (and (eqlist? (car l1) (car l2))
           (eqlist? (cdr l1) (cdr l2))))
     (else #f)))|#

; rewritten using equal?, which itself uses eqlist?
(define (eqlist? l1 l2)
  (cond
    ((and (null? l1) (null? l2)) #t)
    ((or (null? l1) (null? l2)) #f)
    (else (and (equal? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))))))

(define (equal? s1 s2)
  (cond
    ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
    ((or (atom? s1) (atom? s2)) #f)
    (else (eqlist? s1 s2))))

(eqlist? '(strawberry ice cream) '(strawberry ice cream))
(eqlist? '(strawberry ice cream) '(strawberry cream ice))
(eqlist? '(banana ((split))) '((banana) (split)))
(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((salami)) (and (soda))))
(eqlist? '(beef ((sausage)) (and (soda))) '(beef ((sausage)) (and (soda))))
(equal? '() '())
(equal? '() 'a)
