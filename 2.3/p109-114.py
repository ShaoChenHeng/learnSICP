import sys
sys.path.append("..")
from orderedPair import *

#Huffman-Tree

def make_leaf(symbol, weight):
    return lister('leaf', symbol, weight)

def is_leaf(_object):
    return is_equal(car(_object), 'leaf')

def symbol_leaf(x):
    return car(cdr(x))

def weight_leaf(x):
    return car(cdr(cdr(x)))

def left_branch(tree):
    return car(tree)

def right_branch(tree):
    return car(cdr(tree))

def symbols(tree):
    if is_leaf(tree):
        return lister(symbol_leaf(tree))
    return car(cdr(cdr(tree)))

def weight(tree):
    if is_leaf(tree):
        return weight_leaf(tree)
    return car(cdr(cdr(cdr(tree))))

def make_code_tree(left, right):
    return lister(left,
                  right,
                  append(symbols(left), symbols(right)),
                  add(weight(left), weight(right)))

def decode(bits, tree):
    def choose_branch(bit, branch):
        if bit == 0:
            return left_branch(branch)
        elif bit == 1:
            return right_branch
        else:
            print("error, bad bit --CHOOSE_BARANCH {}".format(bit))
            
    def decode_1(bits, current_branch):
        if is_null(bits):
            return None
        next_branch = choose_branch(car(bits), current_branch)
        if is_leaf(next_branch):
            return cons(symbol-leaf(next_branch),
                        decode_1(cdr(bits), tree))
        return decode_1(cdr(bits), next_branch)

def adjoin_set(x, _set):
    if is_null(_set):
        return lister(x)
    elif weight(x) < weight(car(_set)):
        return cons(x, _set)
    return cons(car(_set),
                adjoin_set(x, cdr(_set)))

def make_leaf_set(pairs):
    if is_null(pairs):
        return None
    pair = car(pairs)
    return adjoin_set(make_leaf(car(pair),
                                car(cdr(pair))),
                      make_leaf_set(cdr(pairs)))

# 2_67
sample_tree = make_code_tree(make_leaf('A', 4),
                             make_code_tree(make_leaf('B', 2),
                                            make_code_tree(make_leaf('D', 1),
                                                           make_leaf('C', 1))))

sample_message = lister('0','1','1','0', '0', '1', '0', '1', '0', '1', '1', '1', '0')

# 2_68
def encode(message, tree):
    def is_symbol_in_tree(gain_symbol, tree):
        return findding(lambda x: is_equal(x, gain_symbol),
                        symbols(tree))
    
    def encode_symbol(msg, tree_1):
        if is_leaf(tree_1):
            return None
        elif is_symbol_in_tree(msg, left_branch(tree_1)):
            return cons(0, encode_symbol(msg, left_branch(tree_1)))
        elif is_symbol_in_tree(msg, right_branch(tree_1)):
            return cons(1, encode_symbol(msg, right_branch(tree_1)))
        else:
            print("This symbol not in tree: {}".format(symbol))
    
    if is_null(message):
        return None
    return append(encode_symbol(car(message), tree),
                  encode(cdr(message), tree))

sample_message1 = lister('A', 'D', 'A', 'B', 'B', 'C', 'A')

# 2_69
def generate_huffman_tree(pairs):
    def successive_merge(leaf_set):
        if length(leaf_set) == 0:
            return None
        elif length(leaf_set) == 1:
            return car(leaf_set)
        current_set = make_code_tree(car(leaf_set),
                                     car(cdr(leaf_set)))
        remain_set = cdr(cdr(leaf_set))
        return successive_merge(adjoin_set(current_set, remain_set))
        
    return successive_merge(make_leaf_set(pairs))

sample_tree1 = lister(lister('A', 4),
                      lister('B', 2),
                      lister('C', 1),
                      lister('D', 1))

