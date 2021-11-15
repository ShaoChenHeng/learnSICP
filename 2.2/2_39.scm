(load "2_38.scm")

(define (reverse sequence)
  (fold-right (lambda (x y)
		(append y (list x))) '() sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y)
	       (cons y x)) '() sequence))

(define list1 (list 1 2 3 4))
