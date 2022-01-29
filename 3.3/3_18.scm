(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; 3
(define p3 (cons 'c '()))

(define p2 (cons 'b p3))

(define p1 (cons 'a p2))

;; no return
(define qq3 (cons 'c '()))

(define qq2 (cons 'b qq3))

(define qq1 (cons 'a qq2))

(set-cdr! (cddr qq1) qq1)

(define already-seen '())

(define (seen? x)
  (define (iter already-seen)
    (if (null? already-seen)
	#f
	(or (eq? x (car already-seen))
	    (iter (cdr already-seen)))))
  (iter already-seen))

(define (cycle-check x)
  (if (pair? x)
      (if (seen? x)
	  #t
	  (begin
	    (set! already-seen (cons x already-seen))
	    (cycle-check (car x))
	    (cycle-check (cdr x))))
      #f))
