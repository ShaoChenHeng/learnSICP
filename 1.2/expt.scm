(
    define ( expt b n )
    (
        if ( = n 0 )
        1
        ( * b ( expt b ( - n 1 ) ) )
    )
)

(
    define ( expt2 b n )
    ( expt_iter b n 1 )
)

(
    define ( expt_iter b counter product )
    (
        if ( = counter 0 )
        product
        (
            expt_iter b ( - counter 1 ) ( * b product )
        )
    )
)

(
    define ( fast_expt b n )
    (
        cond ( ( = n 0 ) 1 )
        ( ( iseven n ) ( square ( fast_expt b ( / n 2 ) )) )
        ( else ( * b ( fast_expt b ( - n 1 ) ) ) )
    )
)

(
    define ( square n )
    ( * n n )
)

(
    define ( iseven n )
    ( = ( remainder n 2 ) 0)
)

;(expt 2 3)
;(expt2 2 3)
( fast_expt 2 3 )
(exit)
