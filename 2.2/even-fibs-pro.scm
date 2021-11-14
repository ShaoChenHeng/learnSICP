(define (fib n)
  (define (fib_iter a b count)
    (if (= count 0)
	b
	(fib_iter (+ a b) a (- count 1))))
  (fib_iter 1 0 n))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

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

(define list1 (list 1 2 3 4 5 6))

(define (even-fibs n)
  (accumulate cons
	      '()
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))
