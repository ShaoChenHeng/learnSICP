(define test-list ( list 'a 'b 'c ))

(define (append list1 list2 )
    (if ( null? list1 )
        list2
        ( cons ( car list1 ) ( append ( cdr list1 ) list2 ) )
    )
)

(define (reverse list )
    (define (iter list1 result )
        (if ( null? list1 )
            result
            ( iter ( cdr list1 ) ( cons ( car list1 ) result ) )
        )
    )
    ( iter list '() )
)

(define ans ( reverse test-list ))
;( print-list test-list )
;(display test-list)
;(display ans)
