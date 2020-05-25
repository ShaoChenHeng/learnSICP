(define (Euler k )

    (define (N i ) 1.0 )

    (define (coefficient1 i )
        (cond ( ( = i 1 ) 1.0 )
              ( ( = i 2 ) 2.0 )
              ( (or ( = (remainder i 3 ) 0 )  
                    ( = ( remainder ( - i 1 ) 3) 0 ) )  
                1)
              ( else ( + ( * ( / 2 3 ) i) ( / 2 3) ) )
        )
    )

    (define (coefficient2 i )
        (if (= 0 (remainder (+ i 1) 3))
            (* 2 (/ (+ i 1) 3))
            1))

    (define (D i ) (coefficient1 i ))

    (define (iter i result )
        (if ( = i 0 )
            result
            ( iter ( - i 1 ) ( / ( N i ) ( + result ( D i ) ) )  )
        )
    )

    (iter k ( / ( N k ) ( D k ) ) )
)

(+ 2.0 ( Euler 10000 ))

