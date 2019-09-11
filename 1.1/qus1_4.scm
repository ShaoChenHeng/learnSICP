(define (max x y z) 
    (
        cond( (and ( > x y )  ( > x z )) x )
            ( (and ( > y x )  ( > y z )) y )
            ( (and ( > z x )  ( > z y )) x )
    )
)

(max 10 4 (- 3) )
(exit)
