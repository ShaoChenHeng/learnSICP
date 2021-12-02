(load "huffman.scm")
(load "2_67.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree)'())
	 ((symbol-in-tree? symbol (left-branch tree))
	  (cons 0
		(encode-symbol symbol (left-branch tree))))
	 ((symbol-in-tree? symbol (right-branch tree))
	  (cons 1
		(encode-symbol symbol (right-branch tree))))
	 (else (error "This symbol not in tree: " symbol))))

(define (symbol-in-tree? given-symbol tree)
  (not
   (false?
    (find (lambda (s)
	    (eq? s given-symbol))
	  (symbols tree)))))

(define (false? s)
  (eq? s #f))

(define sample-message1
  (list 'A 'D 'A 'B 'B 'C 'A))


