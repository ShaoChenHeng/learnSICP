import sys 
sys.path.append("..") 
from orderedPair import *

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
