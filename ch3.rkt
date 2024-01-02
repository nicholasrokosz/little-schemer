#lang racket


; The Second Commandment:
; Use cons to build lists.

(define (remberOld a lat)
  (cond
    ((null? lat) '())
    (else (cond
            ((eq? (car lat) a) (cdr lat))
            (else (cons (car lat)
                        (rember a
                          (cdr lat))))))))


(define (rember a lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) a) (cdr lat))
    (else (cons (car lat)
                (rember a (cdr lat))))))

(rember 'mint '(lamb chops and mint jelly))
(rember 'sauce '(soy sauce and tomato sauce))


; The Third Commandment:
; When building a list, describe the first typical element, and then cons it onto the natural recursion.

(define (firsts listOfLists)
  (cond
    ((null? listOfLists) '())
    (else (cons (car (car listOfLists))
                (firsts (cdr listOfLists))))))

(firsts '((a b) (c d) (e f)))


(define (insertR new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons old (cons new (cdr lat))))
    (else (cons (car lat) (insertR new old (cdr lat))))))

(insertR 'e 'd '(a b c d f g))


(define (insertL new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons new lat))
    (else (cons (car lat) (insertL new old (cdr lat))))))

(insertL '2 '3 '(1 3 4 5))


(define (subst new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons new (cdr lat)))
    (else (cons (car lat) (subst new old (cdr lat))))))

(subst 'topping 'fudge '(ice cream with fudge for desert))


(define (subst2 new o1 o2 lat)
  (cond
    ((null? lat) '())
    ((or (eq? (car lat) o1)
         (eq? (car lat) o2))
     (cons new (cdr lat)))
    (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))))

(subst2 'vanilla 'chocolate 'banana '(banana ice cream with chocolate topping))


(define (multirember a lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) a) (multirember a (cdr lat)))
    (else (cons (car lat) (multirember a (cdr lat))))))

(multirember 'cup '(coffee cup tea cup and hick cup))


(define (multiinsertR new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old)
     (cons old
           (cons new
                 (multiinsertR new old (cdr lat)))))
    (else
     (cons (car lat)
           (multiinsertR new old (cdr lat))))))

(multiinsertR 'duck 'duck '(duck duck goose))


; The Fourth Commandment (preliminary):
; Always change at least one argument while recurring. It must be changed to be closer to termination.
; The changing argument must be tested in the termination condition: when using cdr, test termination with null?.

(define (multiinsertL new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons new (cons old (multiinsertL new old (cdr lat)))))
    (else (cons (car lat) (multiinsertL new old (cdr lat))))))

(multiinsertL 'fried 'fish '(chips and fish or fish and fried))


(define (multisubt new old lat)
  (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons new (multisubt new old (cdr lat))))
    (else (cons (car lat) (multisubt new old (cdr lat))))))

(multisubt 'two 'one '(one v. one))
