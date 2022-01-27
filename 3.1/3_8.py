def f():
    def x(first_value):
        return (lambda second_value: 0, first_value)
    return x

y = f()
