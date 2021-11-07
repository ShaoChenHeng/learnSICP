def scale_tree(tree, factor):
    return tuple(map(lambda sub_tree : scale_tree(sub_tree, factor) if type(sub_tree) == tuple else sub_tree * factor,tree))

def scale_tree2(tree, factor):
    def iter(subtree):
        if type(subtree) == tuple:
            return scale_tree2(subtree, factor)
        return subtree * factor
    return tuple(map(iter, tree))

t = ((1, 2), 3, 4)
