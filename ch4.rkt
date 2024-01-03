#lang racket


(define (add1 n)
  (+ n 1))

(add1 67)


(define (sub1 n)
  (- n 1))

(sub1 5)


(define (zero? n)
  (eq? n 0))

(zero? 0)
(zero? 1)


(define (o+ n m)
  (cond
    ((zero? m) n)
    (else (add1 (o+ n (sub1 m))))))

(o+ 12 24)


(define (o- n m)
  (cond
    ((zero? m) n)
    (else (sub1 (o- n (sub1 m))))))

(o- 10 5)


; First commandment revision

(define (* n m)
  (cond
    ((zero? m) 0)
    (else (o+ n (* n (sub1 m))))))

(* 3 5)


; Fifth commandment

(define (tup+ tup1 tup2)
  (cond
    ((null? tup1) tup2)
    ((null? tup2) tup1)
    (else (cons
           (o+ (car tup1) (car tup2))
           (tup+ (cdr tup1) (cdr tup2))))))

(tup+ '(3 6 9 11 4) '(8 5 2 0 7))
(tup+ '(3 7) '(4 6 8 1))
(tup+ '(3 7 8 1) '(4 6))


(define (> n m)
  (cond
    ((zero? n) #f)
    ((zero? m) #t)
    (else (> (sub1 n) (sub1 m)))))

(> 12 133)
(> 120 11)
(> 3 3)


(define (< n m)
  (cond
    ((zero? m) #f)
    ((zero? n) #t)
    (else (< (sub1 n) (sub1 m)))))

(< 4 6)
(< 8 3)
(< 6 6)


(define (= n m)
  (and (eq? (> n m) #f) (eq? (< n m) #f)))

(= 0 0)
(= 12 10)
(= 5 5)


(define (expt n m)
  (cond
    ((zero? m) 1)
    (else (* n (expt n (sub1 m))))))

(expt 1 1)
(expt 2 3)
(expt 5 3)


(define (length lat)
  (cond
    ((null? lat) 0)
    (else (add1 (length (cdr lat))))))

(length '(hotdogs with mustard sauerkraut and pickles))
(length '(ham and cheese on rye))


(define (pick n lat)
  (cond
    ((zero? (sub1 n)) (car lat))
    (else (pick (sub1 n) (cdr lat)))))

(pick 4 '(lasagna spaghetti ravioli macaroni meatball))


(define (no-nums lat)
  (cond
    ((null? lat) '())
    ((number? (car lat)) (no-nums (cdr lat)))
    (else (cons (car lat) (no-nums (cdr lat))))))

(no-nums '(5 pears 6 prunes 9 dates))


(define (all-nums lat)
  (cond
    ((null? lat) '())
    ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
    (else (all-nums (cdr lat)))))

(all-nums '(5 pears 6 prunes 9 dates))


; copied from ./ch2.rkt
(define (atom? s)
  (not (list? s)))

; mine
(define (eqan? a1 a2)
  (cond
    ((and (number? a1) (number? a2)) (= a1 a2))
    ((and (atom? a1) (atom? a2)) (eq? a1 a2))
    (else #f)))

; theirs
(define (eqan?alt a1 a2)
  (cond
    ((and (number? a1) (number? a2)) (= a1 a2))
    ((or (number? a1) (number? a2)) #f)
    (else (eq? a1 a2))))

(eqan? 5 5)
(eqan? 'a 'a)
(eqan? 5 'a)
(eqan? 5 '())
(eqan? '() 'a)


(define (occur a lat)
  (cond
    ((null? lat) 0)
    ((eqan? (car lat) a) (add1 (occur a (cdr lat))))
    (else (occur a (cdr lat)))))

(occur 'cup '(coffee cup tea cup and hick cup))


(define (one? n)
  (= n 1))

(one? 1)
(one? 2)


(define (rempick n lat)
  (cond
    ((one? n) (cdr lat))
    (else (cons (car lat)
                (rempick (sub1 n)
                         (cdr lat))))))

(rempick 3 '(hotdogs with hot mustard))
