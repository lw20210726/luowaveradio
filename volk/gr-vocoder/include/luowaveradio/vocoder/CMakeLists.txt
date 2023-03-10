# Copyright 2012,2013,2016 Free Software Foundation, Inc.
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

########################################################################
# Install header files
########################################################################
install(FILES
    api.h
    alaw_decode_bs.h
    alaw_encode_sb.h
    cvsd_decode_bs.h
    cvsd_encode_sb.h
    g721_decode_bs.h
    g721_encode_sb.h
    g723_24_decode_bs.h
    g723_24_encode_sb.h
    g723_40_decode_bs.h
    g723_40_encode_sb.h
    ulaw_decode_bs.h
    ulaw_encode_sb.h
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/vocoder
)
if(LIBCODEC2_FOUND)
install(FILES
    codec2.h
    codec2_decode_ps.h
    codec2_encode_sp.h
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/vocoder
)
endif(LIBCODEC2_FOUND)
if(LIBCODEC2_HAS_FREEDV_API)
install(FILES
    freedv_api.h
    freedv_rx_ss.h
    freedv_tx_ss.h
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/vocoder
    COMPONENT "vocoder_devel"
)
endif(LIBCODEC2_HAS_FREEDV_API)
if(LIBGSM_FOUND)
install(FILES
    gsm_fr_decode_ps.h
    gsm_fr_encode_sp.h
    DESTINATION ${GR_INCLUDE_DIR}/luowaveradio/vocoder
)
endif(LIBGSM_FOUND)
