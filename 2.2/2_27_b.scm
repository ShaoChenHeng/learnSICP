;; Binary Tree

(define (empty-tree? tree) ( null? tree ))

(define (leaf? tree ) ( not (pair? tree) ))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (make-tree left-branch right-branch ) 
    (list left-branch right-branch ))

(define (better-deep-reverse tree )
    (cond ( (empty-tree? tree) '() )
            ( (leaf? tree) tree )
          (else 
            ( reverse ( make-tree 
                    ( better-deep-reverse( left-branch tree ) )
                    ( better-deep-reverse( right-branch tree ) )
            )))
    )
)

(define list1  ( list ( list ( list 1 2 ) ( list 3 4 ) ) ( list 4 5 ) ) )
(better-deep-reverse list1)
