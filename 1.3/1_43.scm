(define (compose f g )
    (lambda (x)
        ( f ( g x ) )
    )
)

(define (square x ) ( * x x ))

(define (repeated f n )
    (if ( = n 1 )
        ;(lambda (x) (f x))
        f
        (lambda (x) ( 
            f ( (repeated 
                    f
                     (- n 1) 
                ) 
              x )))
    )
)

(define (repeated1 f n )
    (define (iter a g )
        (if ( = a n )
            g
            (lambda (x) ( f ( g x ) ) )
        )
    )
    ( iter 1 f )
)

(define (repeated2 f n )
    (if ( = n 1 )
        f
        (
            compose f ( repeated2 f ( - n 1 ) )
        )
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

( (repeated3 square 2 ) 5 )
