(define (lookup given-key tree-of-records)
  (if (null? tree-of-records)
      #f
      (let ((entry-key (key (entry tree-of-records))))
        (cond ((= given-key entry-key)
               (entry tree-of-records))
              ((> given-key entry-key)
               (lookup given-key (right-branch tree-of-records)))
              ((< given-key entry-key)
               (lookup given-key (left-branch tree-of-records)))))))

(define (key x)
  (if (number? x) x
      (car x)))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) #t)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define a (make-tree 7
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      (make-tree 5 '() '()))
                           (make-tree 9
                                      '()
                                      (make-tree 11 '() '()))))
(define b (make-tree 3
                           (make-tree 1 '() '())
                           (make-tree 7
                                      (make-tree 5 '() '())
                                      (make-tree 9
                                                 '()
                                                 (make-tree 11 '() '())))))

(define c (make-tree 5
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      '())
                           (make-tree 9
                                      (make-tree 7 '() '())
                                      (make-tree 11 '() '()))))





