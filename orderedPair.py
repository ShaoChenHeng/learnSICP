def is_null(item):
    return item is None

def cons(a, b):
    return (a, b)

def car(x):
    return x[0]

def cdr(x):
    return x[1]

def lister(*args):
    def coner(x, y):
        if y == []:
            return cons(x, None)
        else:
            return cons(x, coner(y[0], y[1:]))
    L = list(args)
    first, other = L[0], L[1:]
    return coner(first, other)

def length(elements):
    def _iter(elements, res):
        if is_null(elements):
            return res
        return _iter(cdr(elements), res + 1)
    return _iter(elements, 0)

def findding(func, item):
    if is_null(item):
        return False
    elif func(car(item)):
        return True
    return findding(func, cdr(item))

def mapping(func, item):
    if is_null(item):
        return None
    else:
        return cons(func(car(item)), mapping(func, cdr(item)))

def mapping_n(func, *seqs):
    def seq_trans(seq):
        def translator(s):
            if is_null(cdr(s)):
                return [car(s)]
            else:
                return [car(s)]+translator(cdr(s))
        return tuple(translator(seq))

    def _map(f, seq):
        if is_null(car(seq)):
            return None
        else:
            return cons(f(*seq_trans(car_n(seq))), _map(f, cdr_n(seq)))
        
    if len(seqs) > 1:
        seqs = lister(*seqs)
    else:
        seqs = seqs[0]  
    return _map(func, seqs)

def car_n(item):
    return mapping(car, item)

def cdr_n(item):
    return mapping(cdr, item)

def append(seq1, seq2):
    if is_null(seq1):
        return seq2
    return cons(car(seq1), append(cdr(seq1), seq2))

def remove(item, sequence):
    return filter_(lambda x:
                   (x != item),
                   sequence)

def add(num1, num2):
    return num1 + num2

def mul(num1, num2):
    return num1 * num2

def square(x):
    return x * x

def mod(a, b):
    return a % b

# Miller-Rabin
def is_prime(n):
    def smallest_divisor(n):
        return find_divisor(n, 2)

    def is_divides(a, b):
        return mod(b, a) == 0
    
    def find_divisor(n, test_divisor):
        if square(test_divisor) > n:
            return n
        elif is_divides(test_divisor, n):
            return test_divisor
        return find_divisor(n, test_divisor + 1)

    if n == 1:
        return False
    return n == smallest_divisor(n)

def filter_(predicate, sequence):
    if is_null(sequence):
        return None
    elif predicate(car(sequence)):
        return cons(car(sequence), filter_(predicate, cdr(sequence)))
    return  filter_(predicate, cdr(sequence))

def is_equal(a, b):
    if a == b:
        return True
    return False
