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

def fn_encrypt(filename):
    pass

def fn_decrypt(filename):
    pass


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
