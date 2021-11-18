(load "prime-sum-pairs.scm")
(load "2_40.scm")

(define (triple-sum-equal-to? sum triple)
  (= sum
     (+ (car triple)
	(cadr triple)
	(caddr triple))))

(define (remove-triples-not-equal-to sum triple)
  (filter (lambda (current-triple)
	    (triple-sum-equal-to? sum current-triple))
	  triple))

(define (unique-triples n)
  (flatmap (lambda (i)
	     (map (lambda (j)
		    (cons i j))
		  (unique-pairs (- i 1))))
	   (enumerate-interval 1 n)))

(define (get-n-triples-sum-equals-to-s s n)
  (remove-triples-not-equal-to
   s
   (unique-triples n)))
