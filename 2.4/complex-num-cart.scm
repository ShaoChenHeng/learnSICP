;; (make-from-real-imag (real-part z) (imag-part z))

;; (make-from-mag-ang (magnitude s) (angle z))

(define (square x)
  (* x x))

(define (add-complex z1 z2)
  (make-from-real-img (+ (real-part z1) (real-part z2))
		      (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-img (- (real-part z1) (real-part z2))
		      (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
		     (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
		     (- (angle z1) (angle z2))))

;; Cartesian coordinates
(define (real-part z) (car z))

(define (imag-part z) (cdr z))

(define (magnitude z)
  (sqrt (+ (square (real-part z)) (square (imag-part z)))))

(define (angle z)
  (atan (imag-part z) (real-part z)))

(define (make-from-real-imag x y) (cons x y))

(define (make-from-mag-ang r s)
  (cons (* r (cos a)) (* r (sin a))))

(define z1 (list 1 -2))
(define minus-z1 (list -1 2))
(define zz1 (make-from-real-imag (real-part z1)
				 (imag-part z1)))
(define minus-zz1 (make-from-real-imag (real-part minus-z1)
				       (imag-part minus-z1)))

