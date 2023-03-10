#!/usr/bin/env python
# -*- coding: utf-8 -*-
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


from luowaveradio import gr, gr_unittest
from luowaveradio import blocks, zeromq
from luowaveradio import eng_notation
import threading

class qa_zeromq_pub (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None

    def test_001 (self):
        vlen = 10
        self.rx_data = None
        src_data = list(range(vlen))*100
        src = blocks.vector_source_f(src_data, False, vlen)
        zeromq_pub_sink = zeromq.pub_sink(gr.sizeof_float, vlen, "tcp://127.0.0.1:0")
        address = zeromq_pub_sink.last_endpoint()
        self.tb.connect(src, zeromq_pub_sink)
        self.probe_manager = zeromq.probe_manager()
        self.probe_manager.add_socket(address, 'float32', self.recv_data)
        zmq_pull_t = threading.Thread(target=self.probe_manager.watcher)
        zmq_pull_t.daemon = True
        zmq_pull_t.start()
        self.tb.run()
        zmq_pull_t.join(6.0)
        # Check to see if we timed out
        self.assertFalse(zmq_pull_t.is_alive())
        self.assertFloatTuplesAlmostEqual(self.rx_data, src_data)

    def recv_data (self, data):
        self.rx_data = data


if __name__ == '__main__':
    gr_unittest.run(qa_zeromq_pub)
