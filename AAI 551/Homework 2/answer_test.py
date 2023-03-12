import pytest

from answer import tuple

x, y, z, f, m, n = tuple()


def test_element1():
    assert(x == 13)


def test_element2():
    assert(y == 100)


def test_index():
    assert(z == 7)


def test_repeat():
    assert(f == 3)


def test_sum():
    assert(m == 10168)


def test_maximum():
    assert(n == 8679)
