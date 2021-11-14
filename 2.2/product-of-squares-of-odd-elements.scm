(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd? sequence))))


(define (square x)
  (* x x))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(define list1 (list 1 2 3 4))
