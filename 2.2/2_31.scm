(define (square x)
  (* x x))

(define (tree-map f tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (f tree))
	(else (cons (tree-map f (car tree))
		    (tree-map f (cdr tree))))))

(define list1 (list 1 (list 2 (list 3 4) (list 5 6) 7)))

(define (tree-map2 f tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (tree-map2 f sub-tree)
	     (f sub-tree)))
       tree))
