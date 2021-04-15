#lang racket
(require racklog)

; courses taken relation
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
        [('jamie 'mth 121)]
        [('jamie 'csc 221)]
        [('jamie 'csc 191)]
        [('jamie 'csc 391)]
        [('carrie 'csc 111)]
        [('carrie 'csc 112)]
        [('carrie 'mth 111)]
        [('carrie 'mth 112)]
        [('carrie 'mth 205)]
        ))

; completedCalculus relation
(define %completedCalculus
  (%rel (Student)
        [(Student)
         (%taken Student 'mth 111)]
        [(Student)
         (%taken Student 'mth 112)]
        ))


; family parent relation
(define %parent
  (%rel ()
        [('Curtis 'William)]
        [('Margie 'William)]
        [('Curtis 'Carol)]
        [('Margie 'Carol)]
        [('Ernie 'Jennifer)]
        [('Carol 'Jennifer)]
        [('William 'Billy)]
        [('William 'Laura)]
        [('Mary 'Billy)]
        [('Mary 'Laura)]
        [('Laura 'Virginia)]
        [('Laura 'Miles)]
        ))

; family ancestor relation (partially complete)
(define %ancestor
  (%rel (x y)
        [(x y)
         (%parent x y)]
         ))
