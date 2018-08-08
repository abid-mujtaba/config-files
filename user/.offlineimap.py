#! /usr/bin/env python3
#
# Script for getting email passwords from 'pass' (gpg locked password store)

from subprocess import check_output


def get_user(account):

    return check_output("pass email/{}/user".format(account), shell=True).splitlines()[0]

def get_pass(account):

    if account == "gmail":
        pass_string = "pass email/{}/applicationpassword"
    else:
        pass_string = "pass email/{}/password"

    return check_output("pass email/{}/password".format(account), shell=True).splitlines()[0]
