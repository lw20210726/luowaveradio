#!/usr/bin/env python
#
# Copyright 2013 Free Software Foundation, Inc.
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


from luowaveradio import gr, gr_unittest, blocks

class test_affinity(gr_unittest.TestCase):

    def setUp(self):
        self.tb = gr.top_block()

    def tearDown(self):
        self.tb = None

    def test_000(self):
        # Just run some data through and make sure it doesn't puke.
        src_data = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

        src = blocks.vector_source_f(src_data)
        snk = blocks.vector_sink_f()

        src.set_processor_affinity([0,])
        self.tb.connect(src, snk)
        self.tb.run()

        a = src.processor_affinity()

        self.assertEqual((0,), a)

if __name__ == '__main__':
    gr_unittest.run(test_affinity, "test_affinity.xml")
