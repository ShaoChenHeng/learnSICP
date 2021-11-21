import sys 
sys.path.append("..") 
from orderedPair import *
sys.setrecursionlimit(1000000)

def add(num1, num2):
    return num1 + num2

def accumulate(op, init, seqs):
    if is_null(seqs):
        return init
    return op(car(seqs), accumulate(op, init, cdr(seqs)))

# 2.36
def accumulate_n(op, init, seqs):
    if is_null(car(seqs)):
        return None
    return cons(accumulate(op, init, car_n(seqs)),
                accumulate_n(op, init, cdr_n(seqs)))

# list-fib-squares
def square(x):
    return x * x

def fib(n):
    def fib_iter(k, a, b):
        if k <= 1:
            return b
        return fib_iter(k - 1, b, b + a)
    return fib_iter(n, 0, 1)

def enumerate_interval(low, high):
    if low > high:
        return None
    return cons(low, enumerate_interval(low + 1, high))

def list_fib_squares(n):
    return accumulate(cons, None, mapping(square,
                                     mapping(fib,
                                         enumerate_interval(0, n))))

# 2.37
def mul(num1, num2):
    return num1 * num2

def transpose(mat):
    return accumulate_n(cons, None, mat)

def dot_product(v, w):
    return accumulate(add, 0, mapping_n(mul, v, w))

def matrix_mul_vector(m, v):
    return mapping(lambda col: dot_product(col, v), m)

def matrix_mul_matrix(m, n):
    cols = transpose(n)
    return mapping(lambda col_of_m:
                   mapping(lambda col_of_cols:
                           dot_product(col_of_m, col_of_cols),
                           cols),
                   m)

# prim-sum-pairs
def flat_map(proc, seq):
    return accumulate(append, None, mapping(proc, seq))

def is_prime_sum(pair):
    return is_prime(add(car(pair),
                        car(cdr(pair))))

def make_pair_sum(pair):
    return lister(car(pair),
                  car(cdr(pair)),
                  add(car(pair), car(cdr(pair))))

def prime_sum_pairs0(n):
    return mapping(make_pair_sum,
                   filter_(is_prime_sum,
                           flat_map(lambda i:
                                    mapping(lambda j:
                                            lister(i, j),
                                            enumerate_interval(1, i - 1)),
                                    enumerate_interval(1, n))))
## 2.40
def unique_pairs(n):
    return accumulate(append,
                      None,
                      mapping(lambda i:
                              mapping(lambda j:
                                      lister(i,j),
                                      enumerate_interval(1, i - 1)),
                              enumerate_interval(1, n)))

def prime_sum_pairs1(n):
    return mapping(make_pair_sum,
                   filter_(is_prime_sum,
                           unique_pairs(n)))

# permutation
def permutation(s):
    if is_null(s):
        return lister(None)
    return flat_map(lambda x:
                    mapping(lambda p:
                            cons(x, p),
                            permutation(remove(x, s))),
                    s)

# 2.41
def get_n_triples_sum_equals_to_s(s, n):
    def is_triple_sum_equal_ti(num_sum, triple):
        return num_sum == add(car(triple),
                              add(car(cdr(triplr)),
                                  car(cdr(cdr(triple)))))
    
    def remove_triples_not_equal_to(num_sum, triple):
        return filter_(lambda current_triple:
                       is_triple_sum_equal_to(num_sum, current_triple),
                       triple)

    def unique_triples(n):
        return flat_map(lambda i:
                        mapping(lambda j:
                                con(i, j),
                                unique_pairs(i - 1)),
                        enumerate_interval(1, n))

    return remove_triples_not_equal_to(s, unique_triples(n))

# 2.42 queens-problem
def queens(board_size):
    def empty_board():
        return None

    def iter_check(row_of_new_queen, rest_of_queens, i):
        if is_null(rest_of_queens):
            return True
        row_of_current_queen = car(rest_of_queens)
        if (row_of_new_queen == row_of_current_queen or
            row_of_new_queen == (row_of_current_queen + i) or
            row_of_new_queen == (row_of_current_queen - i)):
            return False
        return iter_check(row_of_new_queen,
                          cdr(rest_of_queens),
                          i + 1)
    
    def is_safe(k, position):
        return iter_check(car(position),
                          cdr(position),
                          1)

    def adjoin_position(new_row, k, rest_of_queens):
        return cons(new_row, rest_of_queens)
    
    def queen_cols(k):
        if k == 0:
            return lister(empty_board())
        return filter_(lambda positions: is_safe(k, positions),
                       flat_map(lambda rest_of_queens:
                                mapping(lambda new_row:
                                        adjoin_position(new_row, k, rest_of_queens),
                                        enumerate_interval(1, board_size)),
                                queen_cols(k - 1)))

    return queen_cols(board_size)

a = lister(1,2,3,4)
b = lister(4,5,6,6)
c = lister(6,7,8,9)
d = lister(a,b,c)

e = lister(1,2,3,4)

f = lister(1,2,3)
g = lister(4,5,6)
h = lister(7,8,9)
i = lister(10,11,12)
dd = lister(f,g,h,i)
