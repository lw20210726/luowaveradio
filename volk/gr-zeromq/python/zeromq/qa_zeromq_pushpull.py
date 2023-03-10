#!/usr/bin/env python
#
# Copyright 2014 Free Software Foundation, Inc.
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


from luowaveradio import gr, gr_unittest, blocks, zeromq
import time

class qa_zeromq_pushpull (gr_unittest.TestCase):

    def setUp (self):
        self.send_tb = gr.top_block()
        self.recv_tb = gr.top_block()

    def tearDown (self):
        self.send_tb = None
        self.recv_tb = None

    def test_001 (self):
        vlen = 10
        src_data = list(range(vlen))*100
        src = blocks.vector_source_f(src_data, False, vlen)
        zeromq_push_sink = zeromq.push_sink(gr.sizeof_float, vlen, "tcp://127.0.0.1:0")
        address = zeromq_push_sink.last_endpoint()
        zeromq_pull_source = zeromq.pull_source(gr.sizeof_float, vlen, address, 0)
        sink = blocks.vector_sink_f(vlen)
        self.send_tb.connect(src, zeromq_push_sink)
        self.recv_tb.connect(zeromq_pull_source, sink)
        self.recv_tb.start()
        time.sleep(0.5)
        self.send_tb.start()
        time.sleep(0.5)
        self.recv_tb.stop()
        self.send_tb.stop()
        self.recv_tb.wait()
        self.send_tb.wait()
        self.assertFloatTuplesAlmostEqual(sink.data(), src_data)

if __name__ == '__main__':
    gr_unittest.run(qa_zeromq_pushpull)
