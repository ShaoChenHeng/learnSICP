(define matrix1 (list (list 1 2 3 4)
		      (list 4 5 6 6)
		      (list 6 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (col)
	 (dot-product col v))
       m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (col-of-m)
	   (map (lambda (col-of-cols)
		  (dot-product col-of-m col-of-cols))
		cols))
	 m)))

(load "accumulate.scm")
(load "2_36.scm")
