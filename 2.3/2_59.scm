(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (iter (append set1 set2) '()))

(define (iter input result)
  (if (null? input)
      (reverse result)
      (let ((current-element (car input))
	    (remain-element (cdr input)))
	;;; unique
	(if (element-of-set? current-element result)
	    (iter remain-element result)
	    (iter remain-element
		  (cons current-element result))))))

(define set1 (list 1 2 3 4))
(define set2 (list 3 4 5 6))

