import pprint


from collections import namedtuple, UserList

pprint.pprint("hello")

Tup = namedtuple("Tup", field_names=["x", "y"], defaults=[0, 0])

test_var = Tup(1, 3)


def test(x: Tup) -> Tup:
    """
    Prints arg to cmdline
    """
    print(x)
    return x


print(test(test_var))
len(test_var)


class TestClass:
    pass


if True:
    print("test")

a = [1, 3]
