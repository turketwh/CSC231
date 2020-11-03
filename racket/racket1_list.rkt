#lang racket

(require racket/trace)
(require htdp/testing)

; from pre-class reading
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