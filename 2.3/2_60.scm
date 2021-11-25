;;; multiset

(define (element-of-multiset? x multiset)
  (cond ((null? multiset) #f)
	((equal? x (car multiset)) #t)
	(else
	 (element-of-multiset? x (cdr multiset)))))

(define (adjoin-multiset x multiset)
  (cons x multiset))

(define (intersection-multiset set1 set2)
  (define (pre-intersection-multiset set1 set2)
    (cond ((or (null? set1) (null? set2))
	   '())
	  ((element-of-multiset? (car set1) set2)
	   (cons (car set1)
		 (pre-intersection-multiset (cdr set1) set2)))
	  (else (pre-intersection-multiset (cdr set1) set2))))
  (iter reverse (pre-intersection-multiset set1 set2) '()))

(define (union-multiset set1 set2)
  (iter reverse (append set1 set2) '()) )

(define (iter func input result)
  (if (null? input)
      (func result)
      (let ((current-element (car input))
	    (remain-element (cdr input)))
	;;; unique
	(if (element-of-multiset? current-element result)
	    (iter func remain-element result)
	    (iter func remain-element
		  (cons current-element result))))))


(define set1 (list 1 2 3 4))
(define set2 (list 3 4 5 6))

