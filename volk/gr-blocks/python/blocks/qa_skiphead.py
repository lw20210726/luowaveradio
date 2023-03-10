#!/usr/bin/env python
#
# Copyright 2007,2010,2013 Free Software Foundation, Inc.
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
import pmt
import numpy


def make_tag(key, value, offset, srcid=None):
    tag = gr.tag_t()
    tag.key = pmt.string_to_symbol(key)
    tag.value = pmt.to_pmt(value)
    tag.offset = offset
    if srcid is not None:
        tag.srcid = pmt.to_pmt(srcid)
    return tag


class test_skiphead(gr_unittest.TestCase):

    def setUp(self):
        self.tb = gr.top_block()
        self.src_data = [int(x) for x in range(65536)]

    def tearDown(self):
        self.tb = None

    def test_skip_0(self):
        skip_cnt = 0
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_1(self):
        skip_cnt = 1
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_1023(self):
        skip_cnt = 1023
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_6339(self):
        skip_cnt = 6339
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_12678(self):
        skip_cnt = 12678
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_all(self):
        skip_cnt = len(self.src_data)
        expected_result = tuple(self.src_data[skip_cnt:])
        src1 = blocks.vector_source_i(self.src_data)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        self.assertEqual(expected_result, dst_data)

    def test_skip_tags(self):
        skip_cnt = 25
        expected_result = tuple(self.src_data[skip_cnt:])

        src_tags = tuple([make_tag('foo', 'bar', 1, 'src'),
                          make_tag('baz', 'qux', 50, 'src')])
        src1 = blocks.vector_source_i(self.src_data, tags=src_tags)
        op = blocks.skiphead(gr.sizeof_int, skip_cnt)
        dst1 = blocks.vector_sink_i()
        self.tb.connect(src1, op, dst1)
        self.tb.run()
        dst_data = dst1.data()
        dst_tags = dst1.tags()
        self.assertEqual(expected_result, dst_data)
        self.assertEqual(dst_tags[0].offset, 25, "Tag offset is incorrect")
        self.assertEqual(len(dst_tags), 1, "Wrong number of tags received")
        self.assertEqual(pmt.to_python(
            dst_tags[0].key), "baz", "Tag key is incorrect")
        self.assertEqual(pmt.to_python(
            dst_tags[0].value), "qux", "Tag value is incorrect")

if __name__ == '__main__':
    gr_unittest.run(test_skiphead, "test_skiphead.xml")
