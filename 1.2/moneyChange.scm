(
    define( first_denomination kind )
    (
        cond( ( = kind 1 ) 1 )
            ( ( = kind 2 ) 5 )
            ( ( = kind 3 ) 10 )
            ( ( = kind 4 ) 25 )
            ( ( = kind 5 ) 50 )
    )
)

(
    define ( cc amount kind )
    (
        cond( ( = amount 0 ) 1 )
            ( ( or ( < amount 0 ) ( = kind 0 ) ) 0 )
            (
                else 
                (
                    + ( cc amount ( - kind 1 ) )
                      ( cc ( - amount ( first_denomination kind ) ) kind )
                )
            )
    )
)

(
    define( change amount )
    ( cc amount 5 )
)

( change 55 )
( exit )

