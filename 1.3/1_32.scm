(define (accumulate2 combiner null-value term a next b )
    (if ( > a b )
        null-value
        (accumulate2 
            combiner 
            (combiner null-value ( term a )) 
            term 
            ( next a ) 
            next b 
        )
    )
)

(define (accumulate combiner null-value term a next b )
    (define (iter a result) 
        (if ( > a  b )
            result
            ( iter ( next a ) (combiner result ( term a )) )
        )
    )
    ( iter a null-value )
)

(define (sum a b  )
    (define (ident x) x )
    (define (next x ) ( + x 1 ) )
    ( accumulate + 0 ident a next b )
)

(define ( multi a b )
    (define (ident x) x )
    (define (next x ) ( + x 1 ) )
    ( accumulate2 * 1 ident a next b )
)

( multi 1 5 )
