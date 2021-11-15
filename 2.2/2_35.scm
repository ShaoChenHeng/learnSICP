;;; 28-fringe.scm

(define (fringe tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))
          (else (append (fringe (car tree))
			(fringe (cdr tree))))))

;;; 35-count-leaves-using-fringe.scm

;; based on fringe
(define (count-leaves t)
  (accumulate (lambda (current-tree remained-tree)
		(+ 1 remained-tree))
	      0
	      (fringe t)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define tree1 (list 1 2 (list 3 4 (list 5) (list 6 7 )) (list 7 8)))

(define (count-leaves2 t)
  (accumulate + 0 (map (lambda (sub-tree)
			 (if (pair? sub-tree)
			   (count-leaves2 sub-tree)
			   1))
		       t)))
