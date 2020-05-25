
(define (square x) (* x x ))

(define (cube x) (* x x x ))

(define (myAbs x)
    (
        cond( ( > x 0 ) x )
            ( ( = x 0 ) 0 )
            ( ( < x 0 ) (- x) )
    
    )
)

(define (improve guess x )
    (
        /  ( +  (/ x (square guess) ) ( * 2 guess )  )  3 
    )
)

(define (sqrtIter guess x )
    (
        if  ( goodEnough guess x ) 
            guess
            ( sqrtIter ( improve guess x ) 
            x )
    )
)

(define ( goodEnough guess x )
    ( < ( myAbs ( - (cube guess) x )  ) 0.001 )
)

(
    define (sqrt x)
    (
        sqrtIter 1.0 x
    )
)

(sqrt 125)

(exit)
