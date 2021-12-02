(load "2_68.scm")
(load "2_69.scm")

(define lyrics '((a 1) (na 16) (boom 1) (Sha 3) (Get 2) (yip 9) (job 2) (Wah 1)))

(define tree (generate-huffman-tree lyrics))

(define msg-1 '(Get a job))
(define bits-1 (encode msg-1 tree))
(define length-1 (length bits-1))

(define msg-2 '(Sha na na na na na na na na))
(define bits-2 (encode msg-2 tree))
(define length-2 (length bits-2))

(define msg-3 '(Wah yip yip yip yip yip yip yip yip yip))
(define bits-3 (encode msg-3 tree))
(define length-3 (length bits-3))

(define msg-4 '(Sha boom))
(define bits-4 (encode msg-4 tree))
(define length-4 (length bits-4))

(define tot
  (+ (* 2 length-1)
     (* 2 length-2)
     length-3
     length-4))

