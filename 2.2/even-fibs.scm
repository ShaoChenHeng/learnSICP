(define (even-fibs n)
  (define (next k)
    (if (> k n)
	'()
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))

(define (fib n)
  (define (fib_iter a b count)
    (if (= count 0)
	b
	(fib_iter (+ a b) a (- count 1))))
  (fib_iter 1 0 n))


