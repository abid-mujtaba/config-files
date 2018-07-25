#!/usr/bin/env python3
#
# A script that can encrypt and decrypt files line by line.
#
# Usage:
#
# ./l2lenc.py --encrypt <filename>
# ./l2lenc.py --decrypt <filename>
#
# The encrypted/decrypted file is output to stdout

import base64
import click
from Crypto.Cipher import AES
from Crypto import Random
from subprocess import check_output


PADDING = '{'       # Padding character for encryption (should not appear at the end of the text)
BLOCKSIZE = 16


def pad(s):
    """
    Function for padding text so that it is in multiples of the BLOCKSIZE
    """

    # Calculate the number of padding characters to be inserted
    if len(s) % BLOCKSIZE == 0:     # If len(s) is a multiple of the BLOCKSIZE then NO extra characters need to be padded
        extra = ''
    else:
        extra = ( BLOCKSIZE - (len(s) % BLOCKSIZE) ) * PADDING

    return s + extra


def fn_encrypt(filename):

    # iv, es = encryption_suite()

    with open(filename) as fin:

        for line in fin.readlines():

            enc = encrypt_line(line)
            print(enc)


def encrypt_line(line):
    """
    Encrypt a single line of clear text and return a Base64 encoded string containing the cipher text.
    """

    # Strip whitespace from right of the string
    line = line.rstrip()

    # Pad line with PADDING character and covert to 'bytes'
    bpl = bytes(pad( line ), "UTF8")

    # Create IV and Encryption Suite for this line
    iv, es = encryption_suite()

    # Encrypt it using the suite
    # Prepend the random IV coupled with the encryption suite

    epl = iv + es.encrypt( pad(line) )
    enc = base64.b64encode(epl)

    return enc


def fn_decrypt(filename):

    # es = encryption_suite()

    with open(filename) as fin:

        for line in fin.readlines():

            dec = decrypt_line(line)
            print(dec)


def decrypt_line(line):

    # Strip whitespace from the string
    line = line.rstrip()
    dpl = base64.b64decode(line)
    iv = dpl[:16]

    iv, es = encryption_suite(iv)

    # Decode the base64 encoding
    # Decrypt using the suite
    # Remove the PADDING from the right end)

    # dec = es.decrypt( base64.b64decode(line) ).rstrip(PADDING) 
    dec = es.decrypt(line)#.rstrip(PADDING)

    return dec


def encryption_suite(iv=None):
    """
    Fetch AES Key and InitialValue from 'pass' (gpg front-end) and use it to create the AES encryption suite.
    """
    key = check_output("pass config/aliases/key", shell=True).splitlines()[0]
    # iv = check_output("pass config/aliases/iv", shell=True).splitlines()[0]

    if not iv:
        iv = Random.new().read(AES.block_size)

    return iv, AES.new(key, AES.MODE_CFB, iv)
    


@click.command()
@click.option('--encrypt', '-e')
@click.option('--decrypt', '-d')
def main(encrypt, decrypt):

    if encrypt:
        fn_encrypt(encrypt)

    elif decrypt:
        fn_decrypt(decrypt)


if __name__ == '__main__':
    main()
