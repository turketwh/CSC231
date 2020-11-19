#lang racket
(require racklog)
(require racket/trace)

(%which (z) (%is z (+ 2 3))) ; should evaluate to z is 5


(define %fourthPower
  (%rel (inputX Y outputZ)
      [(inputX outputZ)
       (%is Y (* inputX inputX))
       (%is outputZ (* Y Y))]
      ))

(%which (z) (%fourthPower 3 z)) ; should evaluate to z is 81

(define %power
  (%rel (Value Exponent Answer Expm1 Subanswer)
        [(Value 0 1)]
        [(Value 1 Value)]
        [(Value Exponent Answer)
         (%> Exponent 1)
         (%is Expm1 (- Exponent 1))
         (%power Value Expm1 Subanswer)
         (%is Answer (* Value Subanswer))]
         ))

(%which (z) (%power 2 3 z)) ; should evaluate to z is 8

(define %memberOfSet
  (%rel (E F R)
        [(E (cons E R))]
        [(E (cons F R))
         (%/== E F)
         (%memberOfSet E R)]))

(%which () (%memberOfSet '2 '())) ; should evaluate to #f
(%which () (%memberOfSet '2 '(2 1 3))) ; should evaluate to '(), meaning true
(%which () (%memberOfSet '2 '(1 2 3))) ; should evaluate to '(), meaning true
(%which () (%memberOfSet '2 '(4 1 3))) ; should evaluate to #f, meaning false

(define %listLength
  (%rel (Answer F R SublistAnswer)
        [('() 0)]
        [((cons F R) Answer)
         (%listLength R SublistAnswer)
         (%is Answer (+ 1 SublistAnswer))]
        ))

(%which (z) (%listLength '() z)) ; should evaluate to z is 0
(%which (z) (%listLength '(2 3 5) z)) ; should evaluate to z is 3


(%which (x) (%append '(1 2) '(3 4) x)) ; should evaluate to x is '(1 2 3 4)
; appears slightly differently via Racket application of . operation, as '(x 1 2 3 4)

(define %appendedLength
  (%rel (L1 L2 N Z)
       [(L1 L2 Z)
        (%append L1 L2 N)
        (%listLength N Z)]
       ))

(%which (z) (%appendedLength '(1 2) '(5 8) z)) ; should evaluate to z is 4

(define %notInSet
  (%rel (E S)
        [(E S)
         (%not (%memberOfSet E S))]))

(%which () (%notInSet 1 '())) ; should evaluate to '(), meaning true
(%which () (%notInSet 1 '(2 3))) ; should evaluate to '(), meaning true
(%which () (%notInSet 1 '(2 1 3))) ; should evaluate to #f, meaning false

