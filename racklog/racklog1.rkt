#lang racket
(require racklog)

; space relations
(define %star
  (%rel ()
        [('sun)]
        [('sirius)]
        [('vega)]))

(define %orbits
  (%rel ()
        [('mercury 'sun)]
        [('venus 'sun)]
        [('earth 'sun)]
        [('mars 'sun)]
        [('jupiter 'sun)]
        [('saturn 'sun)]
        [('uranus 'sun)]
        [('neptune 'sun)]
        [('moon 'earth)]
        [('phobos 'mars)]
        [('deimos 'mars)]))

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

        
; college location relation
(define %location
  (%rel ()
        [('wakeforest 36.133892 -80.278030)]
        [('duke 36.001427 -78.938232)]
        [('uncch 35.898800 -79.041267)]))
