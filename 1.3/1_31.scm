(define (product term a next b )
    (if ( > a b )
        1
        (* ( term a )
            ( product term ( next a ) next b )
        )
    )
)

(define (product2 term a next b)
    (define (iter a ans)
        (if ( > a b )
            ans
            ( iter ( + a 1 ) ( * ( term a ) ans ) )
        )
    )
    ( iter a 1 )
)

(define ( multi a b )
    (define (itself a) a)
    (define (multi-next a) ( + a 1 ))
    ( product itself a multi-next b)
)

(define ( pi n )
    (define (term-up x ) 
        (cond ( ( = x 1 ) 1 )
            ( ( even? x ) ( + x 2) )
            ( else ( + x 1 ) )
        )
    )

    (define (term-down x )
        (cond (( = x 1 ) 3)
            ( ( even? x ) ( + x 1 ) )
            (else  ( + x 2 ) )
        )
    )
    (define (next x ) ( + x 1 ) )
    (  * ( exact->inexact ( / ( product2 term-up 1 next n )
                        ( product2 term-down 1 next n ) )) 8)
)

( pi 1000 )
