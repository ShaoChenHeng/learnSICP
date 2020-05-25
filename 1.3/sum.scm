(define( cube a ) ( * a a a ) )

(define (sum-cubes a b )
    (if ( > a b )
        0
        ( + ( cube a ) ( sum-cubes ( + a 1 ) b ) )
    )
)

(define (sum term a next b )
    (if ( > a b )
        0
        ( + ( term a ) 
            ( sum term ( next a ) next b ) 
        )
    )
)

(define (sum-cubes-pro a b ) ( sum cube a inc b ) )

(define (sum-int a b  ) 
    (define (inc x ) ( + x 1 ) )
    (define (identity x ) x )
    ( sum identity a inc b )  
)

(define (pi-sum a b ) 
    (define (pi-term x ) ( / 1.0 ( * x ( + x 2 ) ) ))
    (define (pi-next x ) ( + x 4 )  )
    ( sum pi-term a pi-next b )
)

;( sum-cubes 3 5 )
;(sum-cubes-pro 3 5 )
;( sum-int 1 100 )
( * 8 (pi-sum 1 1000) )


