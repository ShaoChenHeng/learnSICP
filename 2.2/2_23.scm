(define (for-each1 func sequence )
    (if ( not (null? sequence )) 
        (begin 
            (func ( car sequence ))
            ( for-each func (cdr sequence) ))))

(define (for-each2 func sequence )
    (cond (( not (null? sequence )) 
            (func ( car sequence ))
            ( for-each func (cdr sequence) ))))

;(for-each (lambda (x) ( newline ) (display x) ) (list 1 2 3 4 5) )
(define list1 (list 1 2 3 4 5) )
(for-each2 (lambda (x) ( newline ) ( display x ) ) list1 )
;(display list1)
