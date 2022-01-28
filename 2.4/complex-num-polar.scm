;; (make-from-real-imag (real-part z) (imag-part z))

;; (make-from-mag-ang (magnitude s) (angle z))

(define (square x)
  (* x x))

(define (add-complex z1 z2)
  (make-from-real-img (+ (real-part z1) (real-part z2))
		      (+ (imag-part z1) (imag-part z277))))

(define (sub-complex z1 z2)
  (make-from-real-img (- (real-part z1) (real-part z2))
		      (- (imag-part z1) (imag-part z277))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
		     (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
		     (- (angle z1) (angle z2))))

;; Polar coordinates
(define (imag-part z)
  (* (magnitude z) (sin (angle z))))

(define (real-part z)
  (* (magnitude z) (cos (angle z))))

(define (magnitude z) (car z))

(define (angle z) (cdr z))

(define (make-from-real-imag x y)
  (cons (sqrt (+ (square x) (square y)))
	(atan y x)))

(define (make-from-mag-ang r a)
  (cons r a))
