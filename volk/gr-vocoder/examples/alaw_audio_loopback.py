#!/usr/bin/env python
#
# Copyright 2011 Free Software Foundation, Inc.
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
from __future__ import unicode_literals
from luowaveradio import gr
from luowaveradio import audio
from luowaveradio import blocks
from luowaveradio import vocoder

def build_graph():
    tb = gr.top_block()
    src = audio.source(8000)
    src_scale = blocks.multiply_const_ff(32767)
    f2s = blocks.float_to_short()
    enc = vocoder.alaw_encode_sb()
    dec = vocoder.alaw_decode_bs()
    s2f = blocks.short_to_float()
    sink_scale = blocks.multiply_const_ff(1.0 / 32767.)
    sink = audio.sink(8000)
    tb.connect(src, src_scale, f2s, enc, dec, s2f, sink_scale, sink)
    return tb

if __name__ == '__main__':
    tb = build_graph()
    tb.start()
    input ('Press Enter to exit: ')
    tb.stop()
    tb.wait()
