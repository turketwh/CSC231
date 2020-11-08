#lang racket

(require racket/trace)
(require htdp/testing)

; UNCOMMENT next lines to test -- sumLists --
;(check-expect (sumLists '()) '()) ; note that the answer list holds no values since there were no sub-lists
;(check-expect (sumLists '((5) (8 10))) '(5 18))
;(check-expect (sumLists '((1 2 3) (2) (3 4) (1 2 5 8))) '(6 2 7 16))

; UNCOMMENT next lines to test -- extractLists --
;(check-expect (extractLists '()) '())
;(check-expect (extractLists '((5) (8 10))) '())
;(check-expect (extractLists '((1 2 3) (2) (3 4) (1 2 5 8))) '((1 2 3) (2) (1 2 5 8)))

; UNCOMMENT next lines to test -- concatenateLists --
;(check-expect (concatenateLists '()) '())
;(check-expect (concatenateLists '(() ())) '())
;(check-expect (concatenateLists '((5) (8 10))) '(5 8 10))
;(check-expect (concatenateLists '((1 2 3) (2) (3 4) (1 2 5 8))) '(1 2 3 2 3 4 1 2 5 8))

; UNCOMMENT next lines to test -- concatenateLists --
;(check-expect (truncateLists '()) '())
;(check-expect (truncateLists '(() ())) '(() ()))
;(check-expect (truncateLists '((5) (8 10) (1 2 3 4 5))) '((5) (8 10) (1 2 3 4)))

(generate-report)