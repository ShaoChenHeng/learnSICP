
(define (filtered-accumulath combiner null-value term a next b valid?)
    (define (iter a result )
        (if ( > a b )
            result
            ( if ( valid? a )
                ( iter ( next a ) ( combiner result ( term a ) ) )
                ( iter ( next a ) result )
            )

        )
    )
    ( iter a null-value )
)

(define (gcd a b )
    (if ( = b 0 )
        a
        (gcd  b ( remainder a b  ) )
    )

)

(define (each-prime? x n )
    (and ( < x n )
        ( = 1 ( gcd x n ) )
    )
    
)

(define (prime-each-sum n)
    (filtered-accumulath
        *
        1
        (lambda (x) x)
        1
        (lambda (x) ( + x 1 ) )
        n
        (lambda (x) ( each-prime? x n ) )
    )
)

;( gcd 12 18 )
( prime-each-sum 10 )
