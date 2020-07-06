(define (no-more? money )
    ( null? money )
)

(define (except-first-denomination money )
    ( cdr money )
)

(define (first-denomination money )
    ( car money )
)

( define us-coins ( list 50 25 5 10 1 ) )

(define (cc amount coin-values )
    (cond ( ( = amount 0 ) 1 )
          ( ( or ( < amount 0 ) ( no-more? coin-values ) ) 0)
          (else
            (+ (cc amount 
                    ( except-first-denomination coin-values )
                )
                (cc ( - amount 
                    ( first-denomination coin-values ))
                    coin-values
                )
            )
          )
    )
)

( cc 100 us-coins )
