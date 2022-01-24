(define (make-accumulator init)
  (lambda (num)
    (set! init (+ init num))
    init))
