(define (make-account balance password)
  (let ((max-try-times 7)
	(try-times 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance
      )

    (define (password-match? given-password)
      (eq? given-password password))

    (define (display-wrong-password-message useless-arg)
      (display "Incorrect password"))

    (define (dispatch given-password mode)
      (if (password-match? given-password)
	  (begin
	    (set! try-time 0)
	    (cond ((eq? mode 'withdraw) withdraw)
		  ((eq? mode 'deposit) deposit)
		  (else (error "Unknow request -- MAKE-ACCOUNT" mode))))
	  (begin
	    (set! try-time (+ try-time 1))
	    (if (>= try-time max-try-times) (call-the-cops)
		display-wrong-password-message))))
    dispatch))

(define (call-the-cops)
  (display "You try too much times, calling the cops..."))
