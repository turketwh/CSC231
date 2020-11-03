#lang racket

(require racket/trace)
(require htdp/testing)

; UNCOMMENT next lines to test -- sumListNegative
;(check-expect (sumListNegative '()) 0)
;(check-expect (sumListNegative '(-2)) -2)
;(check-expect (sumListNegative '(1 3)) 0)
;(check-expect (sumListNegative '(1 -2 4 -6)) -8)

; UNCOMMENT next lines to test -- countInList
;(check-expect (countInList 2 '()) 0)
;(check-expect (countInList 5 '(3 2 5 2 2)) 1)
;(check-expect (countInList 2 '(3 2 5 2 2)) 3)
;(check-expect (countInList 8 '(3 2 5 2 2)) 0)

; UNCOMMENT next lines to test -- aggregateSum --
;(check-expect (aggregateSum '()) 0)
;(check-expect (aggregateSum '(1 2)) 3)
;(check-expect (aggregateSum '((1) (5))) 6)
;(check-expect (aggregateSum '(1 (2 3) 4)) 10)
;(check-expect (aggregateSum '(1 (2 3) 5 (6 (7 8)))) 32)

(generate-report)