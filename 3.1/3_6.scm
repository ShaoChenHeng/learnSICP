(define (rand-update x) 
  (let ((a 27) (b 26) (m 127)) 
    (modulo (+ (* a x) b) m))) 
  
(define x1 (rand-update 0)) 
(define x2 (rand-update x1)) 
(define x3 (rand-update x2)) 
(define x4 (rand-update x3)) 
(define x5 (rand-update x4)) 

(define (r)
  (let ((seed 0))
    (define (dispatch m)
      (cond ((eq? m 'reset) (lambda (x) (set! seed x)))
	    ((eq? m 'generate) (begin (set! seed (rand-update seed))
				      seed))
	    (else error "invalid operation")))
    dispatch))

(define rand (r))


