;; Binary Tree
(define (reverse list )
    (define (iter list1 result )
        (if ( null? list1 )
            result
            (iter (cdr list1) (cons (car list1) result))))
    ( iter list '() )
)

(define (deep-reverse tree )
    (cond ( ( null? tree ) '() )
          (( not ( pair? tree ) ) tree )
	  (else
            (reverse (list (deep-reverse (car tree ))
                            (deep-reverse (cadr tree) ))))))

(define list1 ( list ( list 1 2 ) ( list 3 4 ) ))
(deep-reverse list1)
