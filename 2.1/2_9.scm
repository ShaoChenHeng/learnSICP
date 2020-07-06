(define (make-interval a b )
    ( cons a b )
)

(define (lower-bound interval ) ( car interval ))

(define (upper-bound interval ) ( cdr interval ))


(define (print-interval interval )
    ( newline )
    ( display "[" )
    ( display (lower-bound interval) )
    ( display "," )
    ( display ( upper-bound interval ) )
    ( display "]" )
)

(define (add-interval x y )
    ( + ( lower-bound x ) ( lower-bound y )
      + ( upper-bound x ) ( upper-bound y )
    )
)

(define (mul-interval x y )
    (let((p1 ( * ( lower-bound x ) ( lower-bound y )))
         (p2 ( * ( lower-bound x ) ( upper-bound y )))
         (p3 ( * ( upper-bound x ) ( lower-bound y )))
         (p4 ( * ( upper-bound x ) ( upper-bound y )))
        )
        (make-interval ( min p1 p2 p3 p4 )
                       ( max p1 p2 p3 p4 )
        )
    )
)

(define (div-interval x y )
    (let ( ( product-y ( * ( lower-bound y ) ( upper-bound y ) ) ) )
        (if ( < product-y 0 )
            ( display "error " )
            (
            mul-interval x ( make-interval ( / 1.0 (lower-bound y ) ) 
                                       ( / 1.0 ( upper-bound y ) ) )
            )
        )
    )
    
    
)
(define one-three ( make-interval 1 3  ))
(define three-two ( make-interval 3 2  ))

(div-interval one-three three-two)

;(print-interval one-three  )
