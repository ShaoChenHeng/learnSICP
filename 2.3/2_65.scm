(load "2_62.scm")
(load "2_63.scm")
(load "2_64.scm")

(define (insertsection-tree tree another)
  (list->tree (insertsection-set (tree->list-2 tree)
                                 (tree->list-2 another))))

(define (union-tree tree another)
  (list->tree (union-set (tree->list-2 tree)
                         (tree->list-2 another))))

(define ut (union-tree (list->tree '(1 2 3 4 5))
                       (list->tree '(1 3 5 7 9))))
