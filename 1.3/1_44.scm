( define dx 0.000001 )

(define (compose f g )
    (lambda (x)
        ( f ( g x ) )
    )
)

(define (repeated3 f n )
    (define (iter a g )
        (if ( = a n )
            g
            ( compose g ( iter ( + a 1 ) g ) )
        )
    )
    ( iter 1 f )
)


(define (square x ) ( * x x ) )

(define (smooth f )
    (lambda (x) ( / 
                (+ (f ( - x dx ) ) 
                   ( f x ) 
                   ( f ( + x dx ) ) ) 3 
                ) 
    )
)

(define (smooth-n-times f n )
    (let ((n-times-smooth (repeated3 smooth n) ) )
        (n-times-smooth f)
    )
)

(define (smooth-n-times2 f n )
    (define (iter a result )
        (if ( = a n )
            result
            ( smooth result )
        )
    )
    ( iter 1 f )
)

( ( smooth-n-times2 square 10 ) 5 )
