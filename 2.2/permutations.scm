(load "filter.scm")
(load "2_42.scm")

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))

(define a (list 1 2 3 4 5))
