(
    define (double x)
    ( * x 2 )
)

(
    define ( halve y )
    ( / y 2 )
)

(
    define (is_even n)
    ( = ( remainder n 2 ) 0 )
)

(
    define ( fast_mul1 a b  )
    (
        cond ( ( = b 0 ) 0)
        ( ( is_even b ) ( double ( fast_mul1 a ( halve b ) ) ) )
        ( else ( + a (fast_mul1 a ( - b 1 ) ) ) )
    )
)

(
    define ( fast_mul a b )
    ( fast_mul_iter a b 0  )
)

;Russian farmer algorithm
(
    define ( fast_mul_iter a b product )
    (
        cond ( ( = b 0 ) product)
        ( ( is_even b ) ( fast_mul_iter ( double a ) ( halve b ) product ) )
        ( else ( fast_mul_iter a ( - b 1 ) ( + product a ) ) )
    )
)

( fast_mul 11 11 )
