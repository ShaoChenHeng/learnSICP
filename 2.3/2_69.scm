(load "huffman.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-set)
  (cond ((= (length ordered-set) 0) '())
	((= (length ordered-set) 1) (car ordered-set))
	(else
	 (let ((new-sub-tree (make-code-tree (car ordered-set)
					     (cadr ordered-set)))
	       (remain-sub-tree (cddr ordered-set)))
	   (successive-merge (adjoin-set new-sub-tree
					 remain-sub-tree))))))

(generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))
