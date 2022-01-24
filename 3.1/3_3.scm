(define (make-account balance password)

  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (password-match? given-password)
    (eq? given-password password))

  (define (display-wrong-password-message useless-arg)
    (display "Incorrect password"))

  (define (dispatch given-password mode)
    (if (password-match? given-password)
	(cond ((eq? mode 'withdraw) withdraw)
	      ((eq? mode 'deposit) deposit)
	      (else (error "Unknow request -- MAKE-ACCOUNT" mode)))
	display-wrong-password-message))
  dispatch)
