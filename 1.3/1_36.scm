(define tolerance 0.00001 )

(define (display-info guess step)
    (display "Step: ")
    (display step)
    (display " ")
    
    (display "Guess: ")
    (display guess)
    (newline )
)

(define (fixed-point f first-guess )
    (define (close-enough? v1 v2  )
        ( < ( abs ( - v1 v2 ) ) tolerance ))
    (define (try guess step )
        ( display-info guess step )
        (let ( (next ( f guess ) ) )
            (if ( close-enough? guess next )
                (begin
                    ( display-info guess ( + 1 step ) )
                    next
                )
                (try next ( + 1 step ))
            )
        )
    )
    ( try first-guess 1)
)

(
    define ( fast_expt b n )
    (
        cond ( ( = n 0 ) 1 )
        ( ( even? n ) ( square ( fast_expt b ( / n 2 ) )) )
        ( else ( * b ( fast_expt b ( - n 1 ) ) ) )
    )
)

(define (formula x  ) ( / ( log 1000 ) ( log x ) ))
(define (average a b ) ( / ( + a b  ) 2 )  )

(define (average-damp  f)
    (lambda (x) ( average x ( f x ) ) )
)

(display ( fixed-point formula 2.0 ))
(display ( fixed-point (average-damp formula) 2.0 ))
