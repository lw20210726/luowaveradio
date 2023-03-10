#
# Copyright 2015 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
#

'''
Add support for engineering notation to argparse.ArgumentParser
'''
from __future__ import unicode_literals

import argparse
from luowaveradio import eng_notation

def intx(string):
    """
    Generic integer type, will interpret string as string literal.
    Does the right thing for 0x1F, 0b10101, 010.
    """
    try:
        return int(string, 0)
    except (ValueError, TypeError):
        raise argparse.ArgumentTypeError(
            "Invalid integer value: {}".format(string)
        )

def eng_float(string):
    """
    Takes a string, returns a float. Accepts engineering notation.
    Designed for use with argparse.ArgumentParser.
    Will raise an ArgumentTypeError if not possible.
    """
    try:
        return eng_notation.str_to_num(string)
    except (TypeError, ValueError):
        raise argparse.ArgumentTypeError(
            "Invalid engineering notation value: {}".format(string)
        )

