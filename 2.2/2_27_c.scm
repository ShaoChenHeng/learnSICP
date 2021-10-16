;; multiway tree
(define (reverse a)
  (if (null? a)
      '()
      (append (reverse (cdr a)) (list (car a)))))

(define (deep-reverse a)
  (if (null? a)
      '()
      (append (deep-reverse (cdr a))
	      (if (pair? (car a))
		  (list (reverse (car a)))
		  (list (car a))))))

(define x (list (list 1 2) (list 3 4) (list 5 6) (list 7 8 9)))


(reverse x)
(deep-reverse x)

