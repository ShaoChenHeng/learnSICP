(define (floyd x)
  (define (safe-cdr item)
    (if (pair? item)
	(cdr item)
	'()))
    (define (iter slow fast) 
     (cond ((not (pair? slow)) #f) 
           ((not (pair? fast)) #f) 
           ((eq? slow fast) #t)
           (else (iter (safe-cdr slow) (safe-cdr (safe-cdr fast))))))
  (iter (safe-cdr x) (safe-cdr (safe-cdr x))))

(define qq3 (cons 'c '()))

(define qq2 (cons 'b qq3))

(define qq1 (cons 'a qq2))

(set-cdr! (cddr qq1) qq1)

;; 3
(define p3 (cons 'c '()))

(define p2 (cons 'b p3))

(define p1 (cons 'a p2))
