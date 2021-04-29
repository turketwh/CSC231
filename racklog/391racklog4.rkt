#lang racket
(require racklog)

; getNth relation
(define %getNth
  (%rel (F R N Z P)
        [((cons F R) 1 F)]
        [((cons F R) N Z)
         (%is P (- N 1))
         (%getNth R P Z)]
         ))
        
; rel1 relation
(define %rel1
  (%rel (F R1 G R2)
        [('() '())]
        [((cons F R1) (cons G R2))
         (%= F G)
         (%rel1 R1 R2)]
        ))
        
; f relation
(define %f
  (%rel (x y a b c d e g)
        [(0 3)]
        [(1 5)]
        [(x y)
         (%is a (- x 1))
         (%f a b)
         (%is c (- x 2))
         (%f c d)
         (%is e (* 4 b))
         (%is g (* 3 d))
         (%is y (+ e g))]
        ))
        
  ; parent relation
  (define %parent
  (%rel ()
        [('Curtis 'William)]
        [('Curtis 'Carol)]
        [('Carol 'Jennifer)]
        [('William 'Billy)]
        [('William 'Laura)]
        [('Laura 'Virginia)]
        [('Laura 'Miles)]
        ))
        
