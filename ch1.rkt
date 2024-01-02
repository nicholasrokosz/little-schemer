#lang racket

(cons 'a (car '((b) c d)))

(cons 'a (cdr '((b) c d)))

(null? '())

(null? 'spaghetti)

#|
The Law of Car: The primitive car is defined only for non-empty lists.
The Law of Cdr: The primitive cdr is defined only for non-empty lists. The cdr of any non-empty list is always always another list.
The Law of Cons: The primitive cons takes two arguments. The second argument to cons must be a list. The result is a list.
The Law of Null?: The primitive null? is defined only for lists.
The Law of Eq?: The primitive eq? takes two arguments. Each must be a non-numeric atom.
|#
