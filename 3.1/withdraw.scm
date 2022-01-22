
(define blance 100)

(define (widthraw amount)
  (if (>= blance amount)
      (begin (set! blance (- balance amount))
	     balance)
      "Insufficient funds"))
