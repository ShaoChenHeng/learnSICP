(
    define( square n )
    ( * n n )
)

(
    define ( is_even n )
    ( = ( remainder n 2 ) 0 )
)

(
    define ( fast_expt b n  )
    ( fast_expt_iter b n 1 )
)

(
    define ( fast_expt_iter b counter product )
    (
        cond ( ( = counter 0 ) product )
        ( ( is_even counter  ) (  fast_expt_iter ( square b ) ( / counter 2 ) product ))
        ( else ( fast_expt_iter b ( - counter 1 ) ( * product b ) ) )
    )
)

( fast_expt 2 15 )
;(exit)
