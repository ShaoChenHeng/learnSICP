(define (cont-frac1 f g  k )
    (define (iter i result )
        (if ( = i 0 )
            result
            ( iter ( - i 1 ) ( / ( f i ) ( + result ( g i ) ) )  )
        )
    )
    ( iter k ( / ( f k ) ( g k ) ) )
)

(define (cont-frac2 f g  k )
    (if ( = k 0 )
        ( / ( f k ) ( g k ) )
        ( / ( f k ) (+ ( g k ) ( cont-frac2 f g ( - k 1 ) ) ) )
    )
)

(display ( + 1 ( cont-frac2 (lambda (x)  1.0 ) (lambda (x) 1.0 )  100 ) ))
