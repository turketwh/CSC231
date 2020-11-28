#lang racket
(require racklog)

(define %taken
  (%rel ()
        [('ben 'csc 111)]
        [('ben 'csc 112)]
        [('ben 'mth 111)]
        [('ben 'mth 117)]
        [('ben 'csc 221)]
        [('ben 'csc 231)]
        [('mary 'csc 111)]
        [('mary 'csc 112)]
        [('mary 'mth 112)]
        [('mary 'mth 117)]
        [('mary 'csc 221)]
        [('mary 'csc 241)]
        [('mary 'csc 321)]
        [('jamie 'csc 111)]
        [('jamie 'csc 112)]
        [('jamie 'mth 117)]
        [('jamie 'csc 221)]
        [('jamie 'csc 191)]
        [('jamie 'csc 391)]
        [('carrie 'csc 111)]
        [('carrie 'csc 112)]
        [('carrie 'mth 111)]
        [('carrie 'mth 112)]
        ))

(define %completedCSMinorCore
  (%rel (Student)
        [(Student)
         (%taken Student 'csc 111)
         (%taken Student 'csc 112)
         (%taken Student 'csc 221)]
        ))

(define %completedCSMinor
   (%rel (Student C1 C2)
        [(Student)
         (%completedCSMinorCore Student)
         (%taken Student 'mth 117)
         (%taken Student 'csc C1)
         (%>= C1 191)
         (%=/= C1 221)
         (%taken Student 'csc C2)
         (%>= C2 300)
         (%=/= C1 C2)]
        ))

(define %completedCalculus
  (%rel (Student)
        [(Student)
         (%taken Student 'mth 111)]
        [(Student)
         (%taken Student 'mth 112)]
        ))


(define %power
  (%rel (X K A Minus1 Sub)
        [(X 0 1)]
        [(X 1 X)]
        [(X K A)
         (%> K 1)
         (%is Minus1 (- K 1))
         (%power X Minus1 Sub)
         (%is A (* X Sub))]
        ))

(define %func
  (%rel (X K Z A B C D E)
        [(X K Z)
         (%is A (* 2 K))
         (%power X A B)
         (%is C (* 2 B))
         (%power X K D)
         (%is E (* 2 D))
         (%is Z (+ 2 (+ C E)))]
        ))
         

(define %aicHelper
  (%rel (E F R Z T)
        [(E '() 0)]
        [(E (cons F R) Z)
         (%<= E F)
         (%aicHelper E R Z)]
         [(E (cons F R) Z)
         (%> E F)
         (%aicHelper E R T)
         (%is Z (+ 1 T))]
         ))

(define %aic
  (%rel (L Z F R T U)
        [('() 0)]
        [((cons F R) Z)
         (%aicHelper F R T)
         (%aic R U)
         (%is Z (+ T U))]))

(%which (Z) (%aic '() Z)) ; should evaluate to 0
(%which (Z) (%aic '(2) Z)) ; should evaluate to 0
(%which (Z) (%aic '(4 3) Z)) ; should evaluate to 1
(%which (Z) (%aic '(2 3 4) Z)) ; should evaluate to 0
(%which (Z) (%aic '(2 4 3) Z)) ; should evaluate to 1
(%which (Z) (%aic '(4 3 2) Z)) ; should evaluate to 3
(%which (Z) (%aic '(3 4 2 5 1) Z)) ; should evaluate to 6