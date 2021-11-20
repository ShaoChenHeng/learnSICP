def is_null(item):
    return item == None

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
    if item is None:
        return None
    else:
        return cons(func(car(item)), mapping(func, cdr(item)))

def car_n(item):
    return mapping(car, item)

def cdr_n(item):
    return mapping(cdr, item)
