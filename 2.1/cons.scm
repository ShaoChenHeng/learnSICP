(define (make-rat n d ) ( cons n d ) )

(define (numer x ) ( car x )  )

(define (denom x ) ( cdr x )  )

(define (print-rat x )
    ( newline )
    ( display (numer x) )
    ( display "/" )
    ( display ( denom x ) )
)

(define one-half ( make-rat 1 2 )  )

;(define (x) 1)

(print-rat one-half)
