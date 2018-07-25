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


class TestEncryptionSuite(unittest.TestCase):
    """
    Test the creation of the encryption suite.
    """

    def test_empty_iv(self):

        iv, es = l2lenc.encryption_suite()

        self.assertIsNotNone(iv)
        self.assertIsNotNone(es)

        self.assertIsInstance(iv, bytes)
        self.assertEqual(len(iv), l2lenc.BLOCKSIZE)


    def test_passed_iv(self):

        IV = bytes("0123456789abcdef", "UTF8")

        iv, es = l2lenc.encryption_suite(IV)

        self.assertIsNotNone(iv)
        self.assertIsNotNone(es)

        self.assertIsInstance(iv, bytes)
        self.assertEqual(len(iv), l2lenc.BLOCKSIZE)

        self.assertEqual(iv, IV)


if __name__ == '__main__':

    unittest.main()
