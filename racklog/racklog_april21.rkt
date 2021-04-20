#lang racket
(require racklog)

(define %wearAJacket
  (%rel (temp windSpeed)
        [(temp windSpeed)
         (%<= temp 55)]
        [(temp windSpeed)
         (%<= temp 65)
         (%>= windSpeed 10)]
        ))

(define %isSorted
  (%rel (x y L)
        [('())] ; the empty list is sorted
        [((cons x '()))] ; a one item list is sorted
        [((cons x (cons y L))) ; a two or more item list is sorted if: 
         (%<= x y) ; the first item is less than or equal to the second item
         (%isSorted (cons y L))])) ; and the rest of the list is sorted

(define %doSomething
  (%rel (e x L)
        [(e (cons x L))
         (%= e x)]
        [(e (cons x L))
         (%/= e x)
         (%doSomething e L)]))

(define %largest
  (%rel (x f s r Z)
        [((cons x '()) x)] ; the one item in a one-item list is the largest
        [((cons f (cons s r)) Z)  ; Z is the largest under these conditions:
         (%> f s)   ; if first value f > second value s
         (%largest (cons f r) Z)] ; and Z is the largest of list without s
        [((cons f (cons s r)) Z)  ; Z is the largest under these conditions:
         (%>= s f)  ; if second value s >= first value f
         (%largest (cons s r) Z)])) ; and Z is the largest of the list without f

(define %orbits
  (%rel ()
        [('mercury 'sun)]
        [('venus 'sun)]
        [('earth 'sun)]
        [('moon 'earth)]
   ))

(define %planet 
   (%rel (p) 
         [(p) 
          (%orbits p 'sun)]
   ))

(define %satellite
   (%rel (s t)
      [(s) 
       (%orbits s t)
       (%planet t)]
   ))
