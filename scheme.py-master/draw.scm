; Sierpinski

(define (repeat k fn)
    ;Repeat fn k times
    (if (> k 1)
        (begin (fn) (repeat (- k 1) fn))
        (fn))
)

(define (tri fn)
    ;Repeat fn 3 times, eeach followed by a 120 degree turn.
    ( repeat 3   (lambda () (fn) (lt 120))
 ))

(define (sier d k)
    (tri (lambda ()
         ( if (= k 1)(fd d) (leg d k))))
 )

(define (leg d k)
    (sier (/ d 2) (- k 1))
    (penup)
    (fd d)
    (pendown)
 )

(sier 400 6)
