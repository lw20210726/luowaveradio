#!/usr/bin/env python
#
# Copyright 2012,2013 Free Software Foundation, Inc.
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

from __future__ import division

import cmath

from luowaveradio import gr, gr_unittest, analog, blocks

class test_quadrature_demod(gr_unittest.TestCase):

    def setUp(self):
        self.tb = gr.top_block()

    def tearDown(self):
        self.tb = None

    def test_quad_demod_001(self):
        f = 1000.0
        fs = 8000.0

        src_data = []
        for i in range(200):
            ti = i / fs
            src_data.append(cmath.exp(2j*cmath.pi*f*ti))

        # f/fs is a quarter turn per sample.
        # Set the gain based on this to get 1 out.
        gain = 1.0 / (cmath.pi / 4)

        expected_result = [0,] + 199*[1.0]

        src = blocks.vector_source_c(src_data)
        op = analog.quadrature_demod_cf(gain)
        dst = blocks.vector_sink_f()

        self.tb.connect(src, op)
        self.tb.connect(op, dst)
        self.tb.run()

        result_data = dst.data()
        self.assertComplexTuplesAlmostEqual(expected_result, result_data, 5)

if __name__ == '__main__':
    gr_unittest.run(test_quadrature_demod, "test_quadrature_demod.xml")

