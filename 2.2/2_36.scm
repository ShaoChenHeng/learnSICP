(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (car-n seqs))
	    (accumulate-n op init (cdr-n seqs)))))

(define (car-n seqs)
  (map car seqs))

(define (cdr-n seqs)
  (map cdr seqs))

(load "accumulate.scm")

(define sequence (list (list 1 2 3)
		       (list 4 5 6)
		       (list 7 8 9)
		       (list 10 11 12)))

