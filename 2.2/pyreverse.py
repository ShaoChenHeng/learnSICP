def reverse(list1):
    def iter( list1, result, pos ):
        if not list1:
            return result
        else:
            return iter( list1[pos:], result.append(list1[pos]), pos+1 )
    iter( list1, [], 0  )

list1 = [1,2,3,4]
reverse(list1)
print(list1)
