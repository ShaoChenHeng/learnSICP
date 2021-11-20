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
