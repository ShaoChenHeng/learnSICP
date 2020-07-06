(define test-list ( list 'a 'b 'c ))

(define (last-pair list )
    (if ( null? ( cdr list ) )
        list
        ( last-pair ( cdr list ) )
    )
)

( last-pair test-list )
