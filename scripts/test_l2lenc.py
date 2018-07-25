#!/usr/bin/env python3
#
# Unit Tests for the l2lenc.py module.


import l2lenc
import unittest


class TestPad(unittest.TestCase):
    """
    Test the padding of strings.
    """

    def test_full(self):
        self.assertEqual(l2lenc.pad("abcd1234efgh5678"), "abcd1234efgh5678")

    def test_partial(self):
        self.assertEqual(l2lenc.pad("abcd1234efgh5"), "abcd1234efgh5{{{")

    def test_super_partial(self):
        self.assertEqual(l2lenc.pad("abcd1234defg5678hijk9012lmn"), "abcd1234defg5678hijk9012lmn{{{{{")


if __name__ == '__main__':

    unittest.main()
