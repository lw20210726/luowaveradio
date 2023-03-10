#!/usr/bin/env python
#
# Copyright 2004,2007,2010-2013 Free Software Foundation, Inc.
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

import math

from luowaveradio import gr, gr_unittest, analog, blocks

class test_pll_freqdet(gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block()

    def tearDown (self):
        self.tb = None

    def test_pll_freqdet(self):
        expected_result = (0.0,
                            4.338889228818161e-08,
                            0.3776331578612825,
                            1.0993741049896133,
                            2.1332509128284287,
                            3.448827166947317,
                            5.017193050406445,
                            6.810936277840595,
                            8.804128662605573,
                            10.972292025122194,
                            13.292363360097312,
                            15.742678902380248,
                            18.302902979158944,
                            20.954030233328815,
                            23.678333003762834,
                            26.459293141999492,
                            29.2815901542755,
                            32.13105969864019,
                            34.99462836613535,
                            37.860284035876894,
                            40.71702547869386,
                            43.5548208542428,
                            46.364569172614004,
                            49.138038040003174,
                            51.86783994277676,
                            54.547378886619114,
                            57.17080592915505,
                            59.73298657053974,
                            62.229444428114014,
                            64.65634937843706,
                            67.01044048049889,
                            69.28902004673668,
                            71.48990028218192,
                            73.61137363954212,
                            75.65217724529884,
                            77.61146325478951,
                            79.48876920728905,
                            81.28396466515709,
                            82.9972452848542,
                            84.62912095897468,
                            86.18033873945902,
                            87.65188876657749,
                            89.0449983399466,
                            90.36106669970881,
                            91.6016768844999,
                            92.76854829957963,
                            93.86354857479924,
                            94.88865206171563,
                            95.84592204664062,
                            96.73751075064077,
                            97.56564154258655,
                            98.33257336525031,
                            99.04061259327368,
                            99.69208931723288,
                            100.28935141465512,
                            100.83475862103487,
                            101.33065881389933,
                            101.77937615484109,
                            102.18323480545271,
                            102.54452335342484,
                            102.8654948125462,
                            103.14836662270359,
                            103.39530879191456,
                            103.6084320383601,
                            103.78982336428665,
                            103.94148676616939,
                            104.06536695064705,
                            104.16337305045634,
                            104.23733119256288,
                            104.28900821409572,
                            104.32008794641274,
                            104.33220678900258,
                            104.32694185151738,
                            104.30578723783803,
                            104.27016590404165,
                            104.22144151636876,
                            104.16091845122337,
                            104.08982993720561,
                            104.00932619714447,
                            103.9205337379343,
                            103.82447234476369,
                            103.72213808688659,
                            103.6144440277858,
                            103.50225579907487,
                            103.38636788456353,
                            103.26755105212685,
                            103.14649306386876,
                            103.02383425002395,
                            102.90019122489248,
                            102.7761213129379,
                            102.65211069081985,
                            102.5286218192634,
                            102.40608158509168,
                            102.28486944325857,
                            102.16532927481605,
                            102.04778124488143,
                            101.93248622873554,
                            101.81969324369186,
                            101.70961573316195,
                            101.60243156665544) 

        sampling_freq = 10e3
        freq = sampling_freq / 100

        loop_bw = math.pi / 100.0
        maxf = 1
        minf = -1

        src = analog.sig_source_c(sampling_freq, analog.GR_COS_WAVE, freq, 1.0)
        pll = analog.pll_freqdet_cf(loop_bw, maxf, minf)
        head = blocks.head(gr.sizeof_float, int (freq))
        dst = blocks.vector_sink_f()

        self.tb.connect(src, pll, head)
        self.tb.connect(head, dst)

        self.tb.run()
        dst_data = dst.data()

        # convert it from normalized frequency to absolute frequency (Hz)
        dst_data = [i*(sampling_freq / (2*math.pi)) for i in dst_data]

        self.assertFloatTuplesAlmostEqual(expected_result, dst_data, 3)

if __name__ == '__main__':
    gr_unittest.run(test_pll_freqdet, "test_pll_freqdet.xml")
