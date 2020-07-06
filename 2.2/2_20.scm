(define (filter predicate sequence )
    (cond ( ( null? sequence ) '() )
          ( ( predicate ( car sequence ) ) 
            (cons ( car sequence )
                  ( filter predicate (cdr sequence))))
          (else ( filter predicate (cdr sequence) ) )
    )
)

(define (same-parity sample . others )
    ( filter ( if ( even? sample ) 
                even?
                odd?)
            ( cons  sample others )))

( same-parity 1 2 3 4 5 6 7 ) 
