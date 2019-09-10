;if...
;abs()
(define (myabs x)
    (
        cond( ( > x 0 ) x )
            ( ( = x 0 ) 0 )
            ( ( < x 0 ) (- x) )
    
    )
)

(define ( myabs2 x )
    (
        if  ( < x 0 )   
            (- x)
            x
    )

)
 
(
    define ( myabs3 x)
    (
        cond( ( < x 0 ) ( - x ) )
            (else x)
    )

)

(myabs (- 5))
(myabs2 2)
(myabs3 (- 6))
