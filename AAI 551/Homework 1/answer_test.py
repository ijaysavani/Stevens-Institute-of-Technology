import answer;

a, b, c, d = answer.dictionaries()


def test_fruit():
    assert(a == "apple")


def test_quantity():
    assert(b["quantity"] == 19)


def test_programmer():
    assert(c == "programmer")


def test_sort():
    assert(d == ["age", "jobs", "name"])
    
    
e, f, g, h, i = answer.lists()

def test_split():
    assert(e[0] == "Hoboken")
    assert(e[1] == "is")
    assert(e[2] == "Awesome")


def test_slice():
    assert(f=="wesome")


def test_last_row():
    assert(g[0] == 5)
    assert(g[1] == 11)
    assert(g[2] == 38)


def test_diagonal():
    assert(h[0]==10)
    assert(h[1]==38)

def test_ord():
    x = [chr(x) for x in i]
    rec = "".join(x)
    assert(rec == "Hoboken")
    
j, k, l, length, m, n = answer.numbers_and_strings()


def test_power():
    assert(j == 1024)


def test_string():
    assert(k == "Stevens")


def test_repeat():
    assert(len(l) == 7 * len("Stevens"))


def test_len():
    assert(length == 49)


def test_concat():
    assert(m == "Stevens is Great")


def test_replace():
    assert(n == "Stevens is Good")
