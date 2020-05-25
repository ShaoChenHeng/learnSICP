(
    define(cube x) ( * x x x )
)

(
    define( p x ) ( - ( * 3 x ) ( * 4 ( cube x ) ) )
)


(
    define( sine _angle )
    (
        if ( not ( > ( abs _angle ) 0.1 ) )
        _angle
        ( p ( sine ( / _angle 3.0 ) ) )
    )
)

(sine 12.15 )
(exit)
