;N!
(define (fact n)
    (if ( = n 1 )
        1
        ( * n (fact (- n 1)) )
    )

)

(define (fact2 n )
    (define ( factIter product counter n )
        (if ( > counter n ) product
            ( factIter ( * counter product) 
                ( + counter 1 )
                n
            )
        )

    )

    ( factIter 1 1 n ) 

( fact2 4 )

(fact 6)
(exit)
