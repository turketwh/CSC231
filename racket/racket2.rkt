#lang racket

(require racket/trace)
(require htdp/testing)

; from pre-class reading

(define (square x)
  (* x x))

(check-expect (square 1) 1)
(check-expect (square 2) 4)
(check-expect (square 3) 9)

(define (squareList theList)
  (map square theList))

(check-expect (squareList '()) '())
(check-expect (squareList '(2)) '(4))
(check-expect (squareList '(1 2 3)) '(1 4 9))

(define (greaterThan10 X)
  (> X 10))

(check-expect (greaterThan10 0) #f)
(check-expect (greaterThan10 9) #f)
(check-expect (greaterThan10 10) #f)
(check-expect (greaterThan10 11) #t)
(check-expect (greaterThan10 19) #t)

(define (dropSmall theList)
  (filter greaterThan10 theList))

(check-expect (dropSmall '()) '())
(check-expect (dropSmall '(2)) '())
(check-expect (dropSmall '(12)) '(12))
(check-expect (dropSmall '(1 2 12 10 18 8)) '(12 18))

(define (sumList theList)
  (foldl + 0 theList))

(check-expect (sumList '()) 0)
(check-expect (sumList '(2)) 2)
(check-expect (sumList '(1 2 3 4)) 10)

; UNCOMMENT next lines to test -- flipSigns --
;(check-expect (flipSigns '()) '())
;(check-expect (flipSigns '(1)) '(-1))
;(check-expect (flipSigns '(2 -3)) '(-2 3))

; UNCOMMENT next lines to test -- extractEvens --
;(check-expect (extractEvens '()) '())
;(check-expect (extractEvens '(2)) '(2))
;(check-expect (extractEvens '(1 2)) '(2))
;(check-expect (extractEvens '(2 1 4)) '(2 4))

; UNCOMMENT next lines to test -- largest --
;(check-expect (largest '(2)) 2)
;(check-expect (largest '(2 5)) 5)
;(check-expect (largest '(5 2)) 5)
;(check-expect (largest '(2 1 4 3)) 4)
;(check-expect (largest '(-5 -3)) -3)

; UNCOMMENT next lines to test -- longLists --
;(check-expect (longLists '()) '())
;(check-expect (longLists '((5) (8 10))) '())
;(check-expect (longLists '((1 2 3) (2) (3 4) (1 2 5 8))) '((1 2 3) (1 2 5 8)))

; UNCOMMENT next lines to test -- sumLists --
;(check-expect (sumLists '()) '()) ; note that the answer list holds no values since there were no sub-lists
;(check-expect (sumLists '((5) (8 10))) '(5 18))
;(check-expect (sumLists '((1 2 3) (2) (3 4) (1 2 5 8))) '(6 2 7 16))

; UNCOMMENT next lines to test -- extractLists --
;(check-expect (extractLists '()) '())
;(check-expect (extractLists '((5) (8 10))) '())
;(check-expect (extractLists '((1 2 3) (2) (3 4) (1 2 5 8))) '((1 2 3) (2) (1 2 5 8)))

(generate-report)
