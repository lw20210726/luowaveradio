/*
 * Copyright 2011-2016 Free Software Foundation, Inc.
 *
 * This file is part of GNU Radio
 *
 * GNU Radio is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * GNU Radio is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GNU Radio; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#define DIGITAL_API
#define ANALOG_API
#define BLOCKS_API

%include "luowaveradio.i"
%include "stdint.i"

//load generated python docstrings
%include "digital_swig0_doc.i"

%include "luowaveradio/analog/cpm.h"

%{
#include <luowaveradio/blocks/control_loop.h>
%}
%include <luowaveradio/blocks/control_loop.h>

%{
#include "luowaveradio/digital/binary_slicer_fb.h"
#include "luowaveradio/digital/cma_equalizer_cc.h"
#include "luowaveradio/digital/constellation.h"
#include "luowaveradio/digital/constellation_decoder_cb.h"
#include "luowaveradio/digital/constellation_receiver_cb.h"
#include "luowaveradio/digital/constellation_soft_decoder_cf.h"
#include "luowaveradio/digital/corr_est_cc.h"
#include "luowaveradio/digital/correlate_access_code_bb.h"
#include "luowaveradio/digital/correlate_access_code_tag_bb.h"
#include "luowaveradio/digital/correlate_access_code_tag_ff.h"
#include "luowaveradio/digital/correlate_access_code_bb_ts.h"
#include "luowaveradio/digital/correlate_access_code_ff_ts.h"
#include "luowaveradio/digital/costas_loop_cc.h"
#include "luowaveradio/digital/cpmmod_bc.h"
#include "luowaveradio/digital/crc32.h"
#include "luowaveradio/digital/crc32_bb.h"
#include "luowaveradio/digital/crc32_async_bb.h"
#include "luowaveradio/digital/descrambler_bb.h"
#include "luowaveradio/digital/lms_dd_equalizer_cc.h"
#include "luowaveradio/digital/ofdm_carrier_allocator_cvc.h"
#include "luowaveradio/digital/ofdm_chanest_vcvc.h"
#include "luowaveradio/digital/ofdm_cyclic_prefixer.h"
#include "luowaveradio/digital/ofdm_equalizer_base.h"
#include "luowaveradio/digital/ofdm_equalizer_simpledfe.h"
#include "luowaveradio/digital/ofdm_equalizer_static.h"
#include "luowaveradio/digital/ofdm_frame_equalizer_vcvc.h"
#include "luowaveradio/digital/ofdm_serializer_vcc.h"
#include "luowaveradio/digital/ofdm_sync_sc_cfb.h"
%}

%include "luowaveradio/digital/binary_slicer_fb.h"
%include "luowaveradio/digital/cma_equalizer_cc.h"
%include "luowaveradio/digital/constellation.h"
%include "luowaveradio/digital/constellation_decoder_cb.h"
%include "luowaveradio/digital/constellation_receiver_cb.h"
%include "luowaveradio/digital/constellation_soft_decoder_cf.h"
%include "luowaveradio/digital/corr_est_cc.h"
%include "luowaveradio/digital/correlate_access_code_bb.h"
%include "luowaveradio/digital/correlate_access_code_tag_bb.h"
%include "luowaveradio/digital/correlate_access_code_tag_ff.h"
%include "luowaveradio/digital/correlate_access_code_bb_ts.h"
%include "luowaveradio/digital/correlate_access_code_ff_ts.h"
%include "luowaveradio/digital/costas_loop_cc.h"
%include "luowaveradio/digital/cpmmod_bc.h"
%include "luowaveradio/digital/crc32.h"
%include "luowaveradio/digital/crc32_bb.h"
%include "luowaveradio/digital/crc32_async_bb.h"
%include "luowaveradio/digital/descrambler_bb.h"
%include "luowaveradio/digital/lms_dd_equalizer_cc.h"
%include "luowaveradio/digital/ofdm_carrier_allocator_cvc.h"
%include "luowaveradio/digital/ofdm_chanest_vcvc.h"
%include "luowaveradio/digital/ofdm_cyclic_prefixer.h"
%include "luowaveradio/digital/ofdm_equalizer_base.h"
%include "luowaveradio/digital/ofdm_equalizer_simpledfe.h"
%include "luowaveradio/digital/ofdm_equalizer_static.h"
%include "luowaveradio/digital/ofdm_frame_equalizer_vcvc.h"
%include "luowaveradio/digital/ofdm_serializer_vcc.h"
%include "luowaveradio/digital/ofdm_sync_sc_cfb.h"

GR_SWIG_BLOCK_MAGIC2(digital, binary_slicer_fb);
GR_SWIG_BLOCK_MAGIC2(digital, cma_equalizer_cc);
GR_SWIG_BLOCK_MAGIC2(digital, constellation_decoder_cb);
GR_SWIG_BLOCK_MAGIC2(digital, constellation_receiver_cb);
GR_SWIG_BLOCK_MAGIC2(digital, constellation_soft_decoder_cf);
GR_SWIG_BLOCK_MAGIC2(digital, corr_est_cc);
GR_SWIG_BLOCK_MAGIC2(digital, correlate_access_code_bb);
GR_SWIG_BLOCK_MAGIC2(digital, correlate_access_code_tag_bb);
GR_SWIG_BLOCK_MAGIC2(digital, correlate_access_code_tag_ff);
GR_SWIG_BLOCK_MAGIC2(digital, correlate_access_code_bb_ts);
GR_SWIG_BLOCK_MAGIC2(digital, correlate_access_code_ff_ts);
GR_SWIG_BLOCK_MAGIC2(digital, costas_loop_cc);
GR_SWIG_BLOCK_MAGIC2(digital, crc32_bb);
GR_SWIG_BLOCK_MAGIC2(digital, crc32_async_bb);
GR_SWIG_BLOCK_MAGIC2(digital, cpmmod_bc);
GR_SWIG_BLOCK_MAGIC2(digital, descrambler_bb);
GR_SWIG_BLOCK_MAGIC2(digital, lms_dd_equalizer_cc);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_carrier_allocator_cvc);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_chanest_vcvc);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_cyclic_prefixer);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_frame_equalizer_vcvc);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_serializer_vcc);
GR_SWIG_BLOCK_MAGIC2(digital, ofdm_sync_sc_cfb);

GR_SWIG_BLOCK_MAGIC_FACTORY(digital, cpmmod_bc, gmskmod_bc);

// Properly package up non-block objects
%include "constellation.i"
%include "ofdm_equalizer.i"
