(  define ( fib n )
	(  cond ( ( = n 0 ) 0 )
			( ( = n 1 ) 1 )
			( else  ( + 
						( fib ( - n 1 ) )
						( fib ( - n 2 ) )
					)
			)
	)	
)

( define ( fib2 n )
	( fib_iter 1 0 n)
)

( define ( fib_iter a b count )
	(if ( = count 0 )
		b
		( fib_iter ( + a b ) a ( - count 1 ) )
	)
)

( fib 10 )
( fib2 50 )


