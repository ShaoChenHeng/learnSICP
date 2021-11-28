import sys
sys.path.append("..")
from orderedPair import *

def make_tree(entry, left, right):
    return lister(entry, left, right)

def list_to_tree(elements):
    def partial_tree(elts, n):
        if n == 0:
            return cons(None, elts)
        left_size = (n - 1) // 2
        left_result = partial_tree(elts, left_size)
        left_tree = car(left_result)
        non_left_elts = cdr(left_result)

        right_size = n - (left_size + 1)
        this_entry = car(non_left_elts)
        right_result = partial_tree(cdr(non_left_elts), right_size)
        right_tree = car(right_result)
        remaining_elts = cdr(right_result)
        return cons(make_tree(this_entry, left_tree, right_tree),
                    remaining_elts)
    return car(partial_tree(elements, length(elements)))

a1 = lister(1, 3, 5, 7, 9, 11)
