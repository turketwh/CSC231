#lang racket
(require racklog)

; definition of factorial
(define %factorial
  (%rel (x y m n)
        [(0 1)]
        [(1 1)]
        [(x y)
         (%is m (- x 1))
         (%factorial m n)
         (%is y (* x n))]))
