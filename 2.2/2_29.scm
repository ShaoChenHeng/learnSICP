(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-structure branch)
  (cadr branch))

(define (branch-length branch)
  (car branch))

(define (total-weight mobile)
  (let (
	(leftbranch (left-branch mobile))
	(rightbranch (right-branch mobile))
	)
    (+ (if (pair? (branch-structure leftbranch))
	   (total-weight (branch-structure leftbranch))
	   (branch-structure leftbranch))
       (if (pair? (branch-structure rightbranch))
	   (total-weight (branch-structure rightbranch))
	   (branch-structure rightbranch))
     )
    ))

(define x (make-mobile
	   (make-branch 2 (make-mobile (make-branch 1 3) (make-branch 1 4)))
	   (make-branch 2 (make-mobile (make-branch 1 5) (make-branch 1 6)))
	   ))

(total-weight x)

(define (blanced? mobile)
  (let (
	(leftbranch (left-branch mobile))
	(rightbranch (right-branch mobile))
	)
    (and (= (if (pair? (branch-structure leftbranch))
		(* (total-weight (branch-structure leftbranch)) (branch-length leftbranch))
		(* (branch-structure leftbranch) (branch-length leftbranch))
		)
	    (if (pair? (branch-structure rightbranch))
		(* (total-weight (branch-structure rightbranch)) (branch-length rightbranch))
		(* (branch-structure leftbranch) (branch-length leftbranch))
		)
	    )
	 (if (pair? (branch-structure leftbranch)) (balanced? (branch-structure leftbranch)) ture)
	 (if (pair? (branch-structure rightbranch)) (balanced? (branch-structure rightbranch)) ture)
	 )
    )
  )

(define y (make-mobile
	   (make-branch 2 (make-mobile (make-branch 1  6) (make-branch 2 3)))
	   (make-branch 9 (make-mobile (make-branch 3 1) (make-branch 3 1)))
	   ))
