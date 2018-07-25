#!/usr/bin/env python3
#
# Unit Tests for the l2lenc.py module.


import base64
import unittest

import l2lenc


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


class TestUnPad(unittest.TestCase):
    """
    Test the removal of padding characters from a string.
    """

    def test_full(self):
        self.assertEqual(l2lenc.unpad("abcd1234efgh5678"), "abcd1234efgh5678")

    def test_partial(self):
        self.assertEqual(l2lenc.unpad("abcd1234efgh5{{{"), "abcd1234efgh5")

    def test_super_partial(self):
        self.assertEqual(l2lenc.unpad("abcd1234defg5678hijk9012lmn{{{{{"), "abcd1234defg5678hijk9012lmn")


class TestPadUnPad(unittest.TestCase):
    """
    Test the unpadding of padded strings (cycle)
    """

    def test_pad_unpad(self):
        self.assertEqual(l2lenc.unpad(l2lenc.pad("Test")), "Test")
        self.assertEqual(l2lenc.unpad(l2lenc.pad("abcd1234efgh5678")), "abcd1234efgh5678")
        self.assertEqual(l2lenc.unpad(l2lenc.pad("abcd1234efgh5")), "abcd1234efgh5")
        self.assertEqual(l2lenc.unpad(l2lenc.pad("abcd1234defg5678hijk9012lmn")), "abcd1234defg5678hijk9012lmn")



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


class TestEncryptDecryptString(unittest.TestCase):
    """
    Encrypt and Decrypt a test string to test cycle.
    """

    def test_cycle(self):

        PLAINTXT = bytes("0123456789abcdef", "UTF8")
        iv, es = l2lenc.encryption_suite()
        
        et = es.encrypt(PLAINTXT)
        ivet = iv + et

        iv, es = l2lenc.encryption_suite(ivet[:16])
        dt = es.decrypt(ivet)

        self.assertEqual(dt[16:], PLAINTXT)


    def test_cycle_padded_b64(self):
        """
        Test encryption decryption cycle of a string using padding.
        """

        PLAINTXT = "0123456789abc"
        pt = l2lenc.pad(PLAINTXT)
        bpt = bytes(pt, "UTF8")

        iv, es = l2lenc.encryption_suite()
        
        et = es.encrypt(bpt)
        ivet = iv + et

        bivet = base64.b64encode(ivet)
        divet = base64.b64decode(bivet)

        iv, es = l2lenc.encryption_suite(divet[:16])
        dt = es.decrypt(ivet)
        sdt = dt[16:].decode("UTF8")
        upt = l2lenc.unpad(sdt)

        self.assertEqual(upt, PLAINTXT)



class TestEncryptLine(unittest.TestCase):
    """
    Test the encryption of a single line
    """

    def test_encryption(self):

        pass
        # el = l2lenc.encrypt_line("Hello\n")
        # print(el)


class TestEncryptDecryptLine(unittest.TestCase):
    """
    Test the decryption of a single line
    """

    def test_enc_dec(self):

        PLAINTXT = "Hello"
        el = l2lenc.encrypt_line(PLAINTXT)

        print()

        dl = l2lenc.decrypt_line(el)

        self.assertEqual(dl, PLAINTXT)


if __name__ == '__main__':

    unittest.main()
