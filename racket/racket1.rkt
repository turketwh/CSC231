#lang racket

(require racket/trace)
(require htdp/testing)

; from pre-class reading
(define (square x)
  (* x x))

(check-expect (square 1) 1); should return 1
(check-expect (square 2) 4); should return 4
(check-expect (square 3) 9); should return 9

(define (max2 a b)
  (if (> a b)
      a
      b))

(check-expect (max2 4 3) 4); should return 4
(check-expect (max2 3 5) 5); should return 5
(check-expect (max2 7 7) 7); should return 7

(define (max2cond a b)
  (cond
    [(> a b) a]
    [else b]))

(check-expect (max2cond 4 3) 4); should return 4
(check-expect (max2cond 3 5) 5); should return 5
(check-expect (max2cond 7 7) 7); should return 7

(define (reverse theList)
  (if (empty? theList)
      theList
      (append (reverse (rest theList)) (list (first theList)))
      ))

(check-expect (reverse '()) '()) 
(check-expect (reverse '(1)) '(1))
(check-expect (reverse '(1 2)) '(2 1))
(check-expect (reverse '(1 2 3)) '(3 2 1))

(define (length2 theList) ; definition of the length2 function
   (cond
     [(empty? theList) 0]
     [else (+ 1 (length2 (rest theList)))]
     ))

(check-expect (length2 '()) 0) 
(check-expect (length2 '(3)) 1)
(check-expect (length2 '(3 5)) 2)
(check-expect (length2 '(3 4 5)) 3)


; UNCOMMENT next lines to test -- fourthPower --
;(check-expect (fourthPower 1) 1); should return 1
;(check-expect (fourthPower 2) 16); should return 16
;(check-expect (fourthPower 3) 81); should return 81

; UNCOMMENT next lines to test -- factorial --
;(check-expect (factorial 0) 1); should return 1
;(check-expect (factorial 1) 1); should return 1
;(check-expect (factorial 2) 2); should return 2
;(check-expect (factorial 3) 6); should return 6

; UNCOMMENT next lines to test -- isOdd --
;(check-expect (isOdd 2) #f); should return #f (false)
;(check-expect (isOdd 3) #t); should return #t (true)
;(check-expect (isOdd 4) #f); should return #f (false)
;(check-expect (isOdd 5) #t); should return #t (true)

; UNCOMMENT next lines to test -- get2nd --
;(check-expect (get2nd '(1 3)) 3)
;(check-expect (get2nd '(1 5 9)) 5)
;(check-expect (get2nd '(1 (2 3))) '(2 3))

; UNCOMMENT next lines to test -- sumList --
;(check-expect (sumList '()) 0)
;(check-expect (sumList '(1 3)) 4)
;(check-expect (sumList '(1 3 5)) 9)

; UNCOMMENT next lines to test -- containsValue --
;(check-expect (containsValue 2 '()) #f)
;(check-expect (containsValue 2 '(3 2 5)) #t)
;(check-expect (containsValue 4 '(3 2 5)) #f)

(generate-report)