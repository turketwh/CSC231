#lang racket

(require racket/trace)
(require htdp/testing)

; This is inspiration for your own improved countInList function
;(define (countInList value theList)
;  (cond
;    [(empty? theList) 0]
;    [(equal? value (first theList)) (+ 1 (countInList value (rest theList)))]
;    [else (countInList value (rest theList))]
;    ))

; UNCOMMENT next lines to test -- countInList --
;(check-expect (countInList 2 '()) 0)
;(check-expect (countInList 5 '(3 2 5 2 2)) 1)
;(check-expect (countInList 2 '(3 2 5 2 2)) 3)
;(check-expect (countInList 8 '(3 2 5 2 2)) 0)

; UNCOMMENT next lines to test -- deleteSet --
;(check-expect (deleteSet 2 '()) '())
;(check-expect (deleteSet 2 '(2)) '())
;(check-expect (deleteSet 2 '(2 3 4)) '(3 4))
;(check-expect (deleteSet 2 '(3 2 4)) '(3 4))
;(check-expect (deleteSet 3 '(4 5 6)) '(4 5 6))

; UNCOMMENT next lines to test -- insertSet --
;(check-expect (insertSet 2 '()) '(2))
;(check-expect (insertSet 2 '(2 3)) '(2 3))
;(check-expect (insertSet 3 '(4 5 6)) '(4 5 6 3))
;(check-expect (insertSet 2 '(3 2 4)) '(3 2 4))

; UNCOMMENT next lines to test -- productOfPairs --
;(check-expect (productOfPairs '()) '()) 
;(check-expect (productOfPairs '(5)) '(5))
;(check-expect (productOfPairs '(5 4)) '(20))
;(check-expect (productOfPairs '(5 4 3)) '(20 3))
;(check-expect (productOfPairs '(1 2 3 4)) '(2 12))

(generate-report)
