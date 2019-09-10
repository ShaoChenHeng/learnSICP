; mathTest
(define a 4)
(define b 5)
; x^2
(define (square x) (* x x))
(square a)
; x^2 + y^2
(define (sumOfSquares x y) 
    (+ (square x) (square y)) 
)
(sumOfSquares a b)

(exit)
