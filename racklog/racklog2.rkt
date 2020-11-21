#lang racket
(require racklog)

; provided to you
(define %memberOfSet
  (%rel (E F R)
        [(E (cons E R))]
        [(E (cons F R))
         (%/== E F)
         (%memberOfSet E R)]))

(define %factorial
  (%rel (x y m n)
        [(0 1)]
        [(1 1)]
        [(x y)
         (%is m (- x 1))
         (%factorial m n)
         (%is y (* x n))]))


; #1: isNatural

(%which () (%isNatural 0)) ; should evaluate to '()
(%which () (%isNatural 1)) ; should evaluate to '()
(%which () (%isNatural 3)) ; should evaluate to '()
(%which () (%isNatural -1)) ; should evaluate to #f
(%which () (%isNatural 2.5)) ; should evaluate to #f

; #2: combinations

(%which (x) (%combinations 10 10 x)) ; should evaluate to 1
(%which (x) (%combinations 10 1 x)) ; should evaluate to 10
(%which (x) (%combinations 6 4 x)) ; should evaluate to 15

; #3: hasRepeats

(%which () (%hasRepeats '())) ; should evaluate to #f
(%which () (%hasRepeats '(1))) ; should evaluate to #f
(%which () (%hasRepeats '(1 2 3))) ; should evaluate to #f
(%which () (%hasRepeats '(1 2 1))) ; should evaluate to '()
(%which () (%hasRepeats '(2 3 3))) ; should evaluate to '()

; #4: listSum

(%which (x) (%listSum '() x)) ; should evaluate to 0
(%which (x) (%listSum '(2) x)) ; should evaluate to 2
(%which (x) (%listSum '(2 4 6) x)) ; should evaluate to 12

; #5: count

(%which (x) (%count 1 '() x)) ; should evaluate to 0
(%which (x) (%count 1 '(1) x)) ; should evaluate to 1
(%which (x) (%count 1 '(2 1 3 1) x)) ; should evaluate to 2
(%which (x) (%count 1 '(2 3 4) x)) ; should evaluate to 0

; #6: listLessThan

(%which () (%listLessThan '() '())) ; should evaluate to #f
(%which () (%listLessThan '() '(2 1 3))) ; should evaluate to '()
(%which () (%listLessThan '(2 1 3) '())) ; should evaluate to #f
(%which () (%listLessThan '(1 2 3) '(2 4 5 7))) ; should evaluate to '()
(%which () (%listLessThan '(2 4 5 6) '(2 4 5 7))) ; should evaluate to '()
(%which () (%listLessThan '(2 4 5) '(2 4 5 7))) ; should evaluate to '()
(%which () (%listLessThan '(2 4 8) '(2 4 5 7))) ; should evaluate to #f