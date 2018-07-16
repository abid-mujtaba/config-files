#! /usr/bin/env python3
#
# Script for getting email passwords from 'pass' (gpg locked password store)

from subprocess import check_output


def get_user(account):

    return check_output("pass email/{}/user".format(account), shell=True).splitlines()[0]

def get_pass(account):

    return check_output("pass email/{}/password".format(account), shell=True).splitlines()[0]
