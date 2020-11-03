#lang racket

(require racket/trace)
(require htdp/testing)


; UNCOMMENT next lines to test -- fourthPower2 --
;(check-expect (fourthPower2 1) 1); should return 1
;(check-expect (fourthPower2 2) 16); should return 16
;(check-expect (fourthPower2 3) 81); should return 81

; UNCOMMENT next lines to test -- func --
;(check-expect (func 1) 8); should return 8
;(check-expect (func 2) 21); should return 21
;(check-expect (func 3) 40); should return 40

; UNCOMMENT next lines to test -- power --
;(check-expect (power 2 0) 1); should return 1
;(check-expect (power 2 1) 2); should return 2
;(check-expect (power 2 2) 4); should return 4
;(check-expect (power 2 3) 8); should return 8
;(check-expect (power 3 2) 9); should return 9
;(check-expect (power 3 3) 27); should return 27

; UNCOMMENT next lines to test -- logarithm --
;(check-expect (logarithm 4 4) 1); should return 1
;(check-expect (logarithm 3 9) 2); should return 2
;(check-expect (logarithm 2 32) 5); should reutrn 5


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