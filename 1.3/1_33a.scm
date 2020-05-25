(define ( smallest_divisor n ) ( find_divisor n 2 ))

( define ( square x ) ( * x x ) )

( define ( find_divisor n test_divisor ) 
    (
        cond ( ( > ( square test_divisor ) n  ) n )
             ( ( divides? test_divisor n  ) test_divisor )
             ( else ( find_divisor n ( + test_divisor 1 ) ) )
    )
)

( define ( divides? a b ) ( = ( remainder b a ) 0 ))


(
    define ( prime? n )
    (cond (( = n 1 ) false)
        (else ( = n ( smallest_divisor n ) ))
    )
)

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

(define (prime-sum a b)
    (filtered-accumulath
        +
        0
        (lambda (x) x)
        a
        (lambda (x) ( + x 1 ) )
        b
        prime?
    )
)

;( prime? 1 )
( prime-sum 2 20 )
