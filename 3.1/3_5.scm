(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (square x) (* x x))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (cesaro-test)
  ( < (+ (square (random-in-range 0.0 1.0))
	 (square (random-in-range 0.0 1.0)))
      1))

(define (estimate-pi trials)
  (exact->inexact ( * 4 (monte-carlo trials cesaro-test))))
