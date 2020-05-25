(define (average x y )
    (
        / ( + x y ) 2
    )
)

(define (square x) (* x x))

(define (myAbs x)
    (
        cond( ( > x 0 ) x )
            ( ( = x 0 ) 0 )
            ( ( < x 0 ) (- x) )
    
    )
)

(
    define (sqrt x)
    
    (define ( goodEnough guess x )
        ( < ( myAbs ( - (square guess) x )  ) 0.001 )
    )

    (define (improve guess x )
        (
            average guess ( / x guess )
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
    
    (
        sqrtIter 1.0 x
    )
)

(sqrt 9)

(exit)
