(define (list-ref items n )
    (if ( = n 0 )
        ( car items )
        ( list-ref ( cdr items ) ( - n 1 ) )
    )
)

(define (length items )
    (define (length-iter a count )
        (if ( null? a )
            count
            ( length-iter ( cdr a ) ( + 1 count ) )
        )
    )
    ( length-iter items 0 )
)

(define squares (list 1 4 9 16 25) )

(define odds (list 1 3 5 7))

(define (append list1 list2 )
    (if ( null? list1 )
        list2
        ( cons ( car list1 ) ( append ( cdr list1 ) list2 ) )
    )
)

;( list-ref squares 3 )
;(length squares)
( define new-list ( append odds squares ) )
( length new-list )
