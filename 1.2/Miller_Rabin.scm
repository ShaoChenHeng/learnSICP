(define (square x ) ( * x x ) )

(define (Miller_Rabin base exp m  )
    (
        cond( ( = exp 0 ) 1)
            ( ( square_check base m ) 0)
            ( ( even? exp ) ( remainder ( square ( Miller_Rabin base ( / exp 2 ) m ) ) m ) )
            (else
                (remainder  ( Miller_Rabin base ( - exp 1 ) m ) m)
            )
    )
)

(define (square_check a n )
    (
        and ( not ( = a 1 ) )
            ( not ( = a ( - n 1 ) ) )
            ( = 1 ( remainder ( square a ) n ) )
    )
)

(define (Miller_Rabin_test n ) 
    (define (try_it a )
        ( = ( Miller_Rabin a n n ) a )
    )
    ( try_it ( + 1 ( random( - n 1 ) ) ) )
)

(define (fast_prime? n times)
    (
        cond( ( = times 0 ) true )
            ( ( Miller_Rabin_test n ) ( fast_prime? n ( - times 1 ) ) )
            ( else false )
    )
)

(fast_prime? 561 2)
