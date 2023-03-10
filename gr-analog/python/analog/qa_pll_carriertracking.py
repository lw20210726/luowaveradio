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

class test_pll_carriertracking(gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block()

    def tearDown (self):
        self.tb = None

    def test_pll_carriertracking(self):
        expected_result = ((1.000002384185791+7.219194575469601e-09j),
         (0.9980257153511047+0.06279045343399048j),
         (0.992796003818512+0.11979719996452332j),
         (0.9852395057678223+0.17117266356945038j),
         (0.9761406779289246+0.2171468883752823j),
         (0.9661445617675781+0.25799843668937683j),
         (0.9557913541793823+0.29403796792030334j),
         (0.9455097317695618+0.3255884349346161j),
         (0.935634434223175+0.35297322273254395j),
         (0.9264140129089355+0.37650591135025024j),
         (0.918036699295044+0.3964899182319641j),
         (0.9106329679489136+0.4132115840911865j),
         (0.9042812585830688+0.42693787813186646j),
         (0.899017333984375+0.4379141628742218j),
         (0.89484703540802+0.4463684558868408j),
         (0.891755223274231+0.45251286029815674j),
         (0.8897027969360352+0.4565400779247284j),
         (0.8886303901672363+0.45862627029418945j),
         (0.8884686827659607+0.4589335024356842j),
         (0.8891477584838867+0.4576151967048645j),
         (0.8905870318412781+0.4548112750053406j),
         (0.8927018642425537+0.4506511092185974j),
         (0.8954030275344849+0.4452534019947052j),
         (0.898613452911377+0.43873584270477295j),
         (0.9022520780563354+0.4312065541744232j),
         (0.9062415361404419+0.42276597023010254j),
         (0.9104995131492615+0.4135076403617859j),
         (0.9149653315544128+0.4035266935825348j),
         (0.9195748567581177+0.3929111361503601j),
         (0.9242699146270752+0.3817441761493683j),
         (0.9289909601211548+0.37010061740875244j),
         (0.9336962103843689+0.3580598831176758j),
         (0.9383456707000732+0.3456934690475464j),
         (0.9429033994674683+0.3330692648887634j),
         (0.9473329186439514+0.3202497363090515j),
         (0.9516113996505737+0.3072968125343323j),
         (0.9557210206985474+0.2942683696746826j),
         (0.9596443772315979+0.2812172472476959j),
         (0.963365912437439+0.2681918740272522j),
         (0.9668760299682617+0.2552390694618225j),
         (0.9701738357543945+0.24240154027938843j),
         (0.9732568264007568+0.22971850633621216j),
         (0.9761228561401367+0.21722495555877686j),
         (0.9787704944610596+0.20495179295539856j),
         (0.9812103509902954+0.1929289996623993j),
         (0.98344886302948+0.18118229508399963j),
         (0.9854917526245117+0.1697331666946411j),
         (0.9873413443565369+0.1586003601551056j),
         (0.989014744758606+0.147801473736763j),
         (0.9905213713645935+0.1373506784439087j),
         (0.9918720126152039+0.12725868821144104j),
         (0.9930678606033325+0.1175333634018898j),
         (0.9941287040710449+0.10818269848823547j),
         (0.9950648546218872+0.0992119163274765j),
         (0.995887041091919+0.09062285721302032j),
         (0.9965973496437073+0.08241605758666992j),
         (0.9972119927406311+0.07459107041358948j),
         (0.997741162776947+0.06714606285095215j),
         (0.9981945753097534+0.06007742881774902j),
         (0.9985741376876831+0.05337977409362793j),
         (0.9988903999328613+0.04704824090003967j),
         (0.9991542100906372+0.04107558727264404j),
         (0.9993717074394226+0.03545379638671875j),
         (0.9995449185371399+0.03017553687095642j),
         (0.9996798634529114+0.025230854749679565j),
         (0.999785304069519+0.02061113715171814j),
         (0.9998669624328613+0.01630493998527527j),
         (0.9999253749847412+0.012303531169891357j),
         (0.999961256980896+0.008596181869506836j),
         (0.9999842047691345+0.005170613527297974j),
         (0.9999972581863403+0.0020167529582977295j),
         (1.0000011920928955-0.0008766651153564453j),
         (0.9999923706054688-0.0035211145877838135j),
         (0.999980092048645-0.00592736154794693j),
         (0.9999660849571228-0.008106544613838196j),
         (0.9999516606330872-0.010069712996482849j),
         (0.9999289512634277-0.011828280985355377j),
         (0.9999079704284668-0.013392657041549683j),
         (0.9998894333839417-0.01477348804473877j),
         (0.9998739957809448-0.015980780124664307j),
         (0.9998545050621033-0.017024904489517212j),
         (0.9998371601104736-0.017916440963745117j),
         (0.9998237490653992-0.01866436004638672j),
         (0.999815046787262-0.01927858591079712j),
         (0.9998044967651367-0.019767403602600098j),
         (0.9997949600219727-0.020140081644058228j),
         (0.9997900128364563-0.020405471324920654j),
         (0.9997888207435608-0.020570307970046997j),
         (0.9997872114181519-0.020643681287765503j),
         (0.9997851848602295-0.020633310079574585j),
         (0.9997866153717041-0.020545780658721924j),
         (0.9997920989990234-0.020388543605804443j),
         (0.9997975826263428-0.02016708254814148j),
         (0.9998003840446472-0.019888341426849365j),
         (0.99980628490448-0.019558459520339966j),
         (0.9998152256011963-0.019182950258255005j),
         (0.9998254179954529-0.01876668632030487j),
         (0.9998309016227722-0.01831553876399994j),
         (0.999838650226593-0.017833217978477478j),
         (0.9998488426208496-0.017324130982160568j))

        sampling_freq = 10e3
        freq = sampling_freq / 100

        loop_bw = math.pi / 100.0
        maxf = 1
        minf = -1

        src = analog.sig_source_c(sampling_freq, analog.GR_COS_WAVE, freq, 1.0)
        pll = analog.pll_carriertracking_cc(loop_bw, maxf, minf)
        head = blocks.head(gr.sizeof_gr_complex, int (freq))
        dst = blocks.vector_sink_c()

        self.tb.connect(src, pll, head)
        self.tb.connect(head, dst)

        self.tb.run()
        dst_data = dst.data()
        self.assertComplexTuplesAlmostEqual(expected_result, dst_data, 5)

if __name__ == '__main__':
    gr_unittest.run(test_pll_carriertracking, "test_pll_carriertracking.xml")
