(define zero 
    (lambda (f) (lambda (x) x ) )
)

(define (add-1 n )
    (lambda (f) (lambda (x) ( f (( n f ) x ) ) ))
)

(define one
    (lambda (f)
        (lambda (x)
            (f x))))

(define two
    (lambda (f)
        (lambda (x)
            (f (f x)))))

(define (plus first second)
    (lambda (f)
        (lambda (x)
            (( first f )
             (( second f ) x)
            )
        )
    )
)

(define (foo x)
    (display "哈"))
(( ( plus one two) foo ) '1)
