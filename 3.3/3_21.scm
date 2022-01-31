(load "queue.scm")
(define (print-queue queue)
  (define (iter queue)
    (if (null? queue)
	'()
	(cons (car queue) (iter (cdr queue)))))
  (iter (front-ptr queue)))
