#lang racket

(require racket/trace)
(require htdp/testing)

; For functionA:
; Assume theList is a list of numbers
(define (functionA theList)
  (cond
    [(empty? theList) 0]
    [else (/ (foldl + 0 theList) (length theList))]))

; This function is made use of by functionB below.
; It is the "containsValue" function we have written
; and used for previous problems.
(define (containsValue item theList)
  (cond
    [(empty? theList) false]
    [(= item (first theList)) true]
    [else (containsValue item (rest theList))]))

; For functionB: 
; Assume theList is a list of numbers
(define (functionB theList)
  (if (empty? theList)
      #f
      (if (empty? (rest theList))
          #f
          (or (containsValue (first theList) (rest theList)) (functionB (rest theList))))))

; For functionC:
; Assume item is a number
; Assume theList is a list of numbers in ascending (small to large)
; sorted order, such as '(1 3 6 7 10)
(define (functionC item theList)
  (cond
    [(empty? theList) (cons item '())]
    [else
     (cond
       [(< item (first theList)) (cons item theList)]
       [else (cons (first theList) (functionC item (rest theList)))])]))
