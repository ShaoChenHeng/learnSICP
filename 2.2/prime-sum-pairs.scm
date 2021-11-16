(load "accumulate.scm")
(load "filter.scm")
(load "enumerate-interval.scm")

(define (smallest_divisor n) (find_divisor n 2))

(define (square x) (* x x ) )

(define (find_divisor n test_divisor)
  (cond ((> (square test_divisor) n)n )
        ((divides? test_divisor n) test_divisor )
        (else (find_divisor n (+ test_divisor 1)))))

(define (divides? a b)
  (= (remainder b a)
     0))

(define (prime? n)
    (cond (( = n 1) false)
        (else (= n (smallest_divisor n)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))))
