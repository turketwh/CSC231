#lang racket
(require racklog)

; query that leads to performing addition
(%which (z) (%is z (+ 2 3)))

; definition of fourthPower
(define %fourthPower
  (%rel (inputX Y outputZ)
      [(inputX outputZ)
       (%is Y (* inputX inputX))
       (%is outputZ (* Y Y))]
      ))

; query that uses fourthPower
(%which (z) (%fourthPower 3 z))

; definition of power
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

; query that uses power
(%which (z) (%power 2 3 z))
