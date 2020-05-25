(define (cube x) ( * x x x )  )

(define (sum term a next b )
    (if ( > a b )
        0
        ( + ( term a ) 
            ( sum term ( next a ) next b ) 
        )
    )
)

(define (simpson f a b n)  
    (define h ( / ( - b a ) n ))

    (define k a )

    (define (next k) ( + k 1 ) )

    (define (y k) ( f (+ a ( * k h ) ) ) )

    (define (coefficient k)  
        (cond
            ((or ( = k 0 ) ( = k n )) 1)
            (( even? k ) 2)
            ( else 4 )
        )
    )

    (define (foo k) ( * ( coefficient k ) ( y k ) ) )

    ( * ( sum foo k next n ) ( / h 3.0 ) )
)

(simpson cube 0 1.5 100)
