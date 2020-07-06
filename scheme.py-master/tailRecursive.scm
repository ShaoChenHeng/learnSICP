; Returns n! * k

(define ( factorial n k  )
 (
    if ( zero? n  ) k
        ( factorial ( - n 1  ) ( * k n  )  )
  )
 
 )

(factorial 3 2)

(exit)
