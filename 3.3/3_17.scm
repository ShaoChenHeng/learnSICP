(define already-seen '())

(define (seen? x)
  (define (iter already-seen)
    (if (null? already-seen)
	#f
	(or (eq? x (car already-seen))
	    (iter (cdr already-seen)))))
  (iter already-seen))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (if (seen? x)
	  0
	  (begin
	    (set! already-seen (cons x already-seen))
	    (+ (count-pairs (car x))
	       (count-pairs (cdr x))
	       1)))))


;; 3
(define p3 (cons 'c '()))

(define p2 (cons 'b p3))

(define p1 (cons 'a p2))

;; 4
(define pp3 (cons 'a '()))

(define pp2 (cons pp3 '()))

(define pp1 (cons pp2 pp3))

;; 7
(define q3 (cons 'a '()))

(define q2 (cons q3 q3))

(define q1 (cons q2 q2))

;; no return
(define qq3 (cons 'c '()))

(define qq2 (cons 'b qq3))

(define qq1 (cons 'a qq2))

(set-cdr! (cddr qq1) qq1)

