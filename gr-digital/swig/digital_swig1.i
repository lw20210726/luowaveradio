/*
 * Copyright 2016,2017 Free Software Foundation, Inc.
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
%include "digital_swig1_doc.i"

 //%include "luowaveradio/analog/cpm.h"

%{
#include <luowaveradio/blocks/control_loop.h>
%}
%include <luowaveradio/blocks/control_loop.h>

%{
#include "luowaveradio/digital/additive_scrambler_bb.h"
#include "luowaveradio/digital/burst_shaper.h"
#include "luowaveradio/digital/chunks_to_symbols.h"
#include "luowaveradio/digital/clock_recovery_mm_cc.h"
#include "luowaveradio/digital/clock_recovery_mm_ff.h"
#include "luowaveradio/digital/diff_decoder_bb.h"
#include "luowaveradio/digital/diff_encoder_bb.h"
#include "luowaveradio/digital/diff_phasor_cc.h"
#include "luowaveradio/digital/fll_band_edge_cc.h"
#include "luowaveradio/digital/framer_sink_1.h"
#include "luowaveradio/digital/glfsr.h"
#include "luowaveradio/digital/glfsr_source_b.h"
#include "luowaveradio/digital/glfsr_source_f.h"
#include "luowaveradio/digital/hdlc_deframer_bp.h"
#include "luowaveradio/digital/hdlc_framer_pb.h"
#include "luowaveradio/digital/header_payload_demux.h"
#include "luowaveradio/digital/kurtotic_equalizer_cc.h"
#include "luowaveradio/digital/lfsr.h"
#include "luowaveradio/digital/map_bb.h"
#include "luowaveradio/digital/metric_type.h"
#include "luowaveradio/digital/modulate_vector.h"
#include "luowaveradio/digital/msk_timing_recovery_cc.h"
%}

%include "luowaveradio/digital/additive_scrambler_bb.h"
%include "luowaveradio/digital/burst_shaper.h"
%include "luowaveradio/digital/chunks_to_symbols.h"
%include "luowaveradio/digital/clock_recovery_mm_cc.h"
%include "luowaveradio/digital/clock_recovery_mm_ff.h"
%include "luowaveradio/digital/diff_decoder_bb.h"
%include "luowaveradio/digital/diff_encoder_bb.h"
%include "luowaveradio/digital/diff_phasor_cc.h"
%include "luowaveradio/digital/fll_band_edge_cc.h"
%include "luowaveradio/digital/framer_sink_1.h"
%include "luowaveradio/digital/glfsr.h"
%include "luowaveradio/digital/glfsr_source_b.h"
%include "luowaveradio/digital/glfsr_source_f.h"
%include "luowaveradio/digital/hdlc_deframer_bp.h"
%include "luowaveradio/digital/hdlc_framer_pb.h"
%include "luowaveradio/digital/header_payload_demux.h"
%include "luowaveradio/digital/kurtotic_equalizer_cc.h"
%include "luowaveradio/digital/lfsr.h"
%include "luowaveradio/digital/map_bb.h"
%include "luowaveradio/digital/metric_type.h"
%include "luowaveradio/digital/modulate_vector.h"
%include "luowaveradio/digital/msk_timing_recovery_cc.h"

GR_SWIG_BLOCK_MAGIC2(digital, additive_scrambler_bb);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, burst_shaper_cc, burst_shaper<gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, burst_shaper_ff, burst_shaper<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_bc, chunks_to_symbols<std::uint8_t,gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_bf, chunks_to_symbols<std::uint8_t,float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_ic, chunks_to_symbols<std::int32_t,gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_if, chunks_to_symbols<std::int32_t,float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_sc, chunks_to_symbols<std::int16_t,gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(digital, chunks_to_symbols_sf, chunks_to_symbols<std::int16_t,float>);
GR_SWIG_BLOCK_MAGIC2(digital, clock_recovery_mm_cc);
GR_SWIG_BLOCK_MAGIC2(digital, clock_recovery_mm_ff);
GR_SWIG_BLOCK_MAGIC2(digital, diff_decoder_bb);
GR_SWIG_BLOCK_MAGIC2(digital, diff_encoder_bb);
GR_SWIG_BLOCK_MAGIC2(digital, diff_phasor_cc);
GR_SWIG_BLOCK_MAGIC2(digital, fll_band_edge_cc);
GR_SWIG_BLOCK_MAGIC2(digital, framer_sink_1);
GR_SWIG_BLOCK_MAGIC2(digital, glfsr_source_b);
GR_SWIG_BLOCK_MAGIC2(digital, glfsr_source_f);
GR_SWIG_BLOCK_MAGIC2(digital, hdlc_deframer_bp);
GR_SWIG_BLOCK_MAGIC2(digital, hdlc_framer_pb);
GR_SWIG_BLOCK_MAGIC2(digital, header_payload_demux);
GR_SWIG_BLOCK_MAGIC2(digital, kurtotic_equalizer_cc);
GR_SWIG_BLOCK_MAGIC2(digital, map_bb);
GR_SWIG_BLOCK_MAGIC2(digital, msk_timing_recovery_cc);
