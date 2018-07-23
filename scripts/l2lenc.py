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
