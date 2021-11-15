;;; p70-map.scm

(define (map-p70 p sequence)
    (if (null? sequence)
        '()
        (cons (p (car sequence))
              (map-p70 p (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))


(define list1 (list 1 2 3 4 5))


;;; p68-append.scm

(define (append-p68 list1 list2)
    (if (null? list1)
        list2
        (cons (car list1)
              (append-p68 (cdr list1) list2))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define list2 (list 11 22 33 44 55))

;;; p68-length.scm

(define (length-p68 items)
    (if (null? items)
        0
        (+ 1 
           (length-p68 (cdr items)))))

(define (length sequence)
  (accumulate (lambda (x y)
		(+ 1 y)) 0 sequence))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
