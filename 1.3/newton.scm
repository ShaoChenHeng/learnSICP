(define dx 0.00001 )

(define tolerance 0.00001 )

(define (fixed-point f first-guess )
    (define (close-enough? v1 v2  )
        ( < ( abs ( - v1 v2 ) ) tolerance ))
    (define (try guess  )
        (let ( (next ( f guess ) ) )
            (if ( close-enough? guess next )
                next
                ( try next )
            )
        )
    )
    ( try first-guess )
)

(define (cube x ) ( * x x x ))

(define (deriv g )
    (lambda (x) 
        ( / ( -  (g ( + x dx ) ) (g x ) ) dx ) 
    )
)

(define (newton-transform g )
    (lambda (x)
        ( - x ( / ( g x ) (( deriv g ) x) ) )
    )
)

(define (newton-method g guess )
    ( fixed-point ( newton-transform g ) guess )
)

(define (sqrt1 x )
    ( newton-method (lambda (y) ( - ( square y ) x ) ) 1.0 )
)

;(sqrt 4)

(define (fixed-point-of-transform g transform guess )
    ( fixed-point ( transform g ) guess )
)

( define (average a b ) ( / ( + a b ) 2 )  )

(define (average-damp f  )
    (lambda (x) ( average (f x) x ) )
)

(define (sqrt2 x )
    ( fixed-point-of-transform (lambda (y) ( / x y ) ) average-damp 1.0 )
)

(define (sqrt3 x )
    (fixed-point-of-transform 
        (lambda (y) ( - ( square y ) x )  )
        newton-transform
        1.0
    )
)

( sqrt3 9 )
