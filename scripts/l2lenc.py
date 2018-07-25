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

import click
from Crypto.Cipher import AES
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

    es = encryption_suite()

    with open(filename) as fin:
        for line in fin.readlines():
            print(es.encrypt(line.strip()[:16]))


def fn_decrypt(filename):

    pass


def encryption_suite():
    """
    Fetch AES Key and InitialValue from 'pass' (gpg front-end) and use it to create the AES encryption suite.
    """
    key = check_output("pass config/aliases/key", shell=True).splitlines()[0]
    iv = check_output("pass config/aliases/iv", shell=True).splitlines()[0]

    return AES.new(key, AES.MODE_CBC, iv)
    


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
