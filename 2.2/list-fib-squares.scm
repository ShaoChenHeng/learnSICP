(define (list-fib-squares n)
  (accumulate cons
	      '()
	      (map square
		   (map fib
			(enumerate-interval 0 n)))))
(define (fib n)
  (define (fib_iter a b count)
    (if (= count 0)
	b
	(fib_iter (+ a b) a (- count 1))))
  (fib_iter 1 0 n))

(define (square x)
  (* x x))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
