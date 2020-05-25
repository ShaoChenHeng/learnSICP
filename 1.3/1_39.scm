(define (square x ) ( * x x )  )

(define (cont-frac1 f g  k )
    (define (iter i result )
        (if ( = i 0 )
            result
            ( iter ( - i 1 ) ( / ( f i ) ( + result ( g i ) ) )  )
        )
    )
    ( iter k ( / ( f k ) ( g k ) ) )
)

(define (tan-cf x k )
    (define (N i )  
        (if ( = i 1 ) x
            ( -( square x ))
        )
    )

    (define (D i )
        ( -( * 2 i  ) 1 ))

    ( exact->inexact (cont-frac1 N D k ))
)

( tan-cf (/ 3.1415 4) 100 )
