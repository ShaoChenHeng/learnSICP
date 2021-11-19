(define (map proc items )
    (if ( null? items )
        '()
        (cons ( proc ( car items ) )
              ( map proc ( cdr items ) )
        )
    )
)

( map abs ( list 1 2 (- 3) 4.1 (- 5.2)  ) )