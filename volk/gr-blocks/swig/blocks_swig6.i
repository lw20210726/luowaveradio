/* -*- c++ -*- */
/*
 * Copyright 2017 Free Software Foundation, Inc.
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

#define BLOCKS_API

%include "luowaveradio.i"
%include "luowaveradio/blocks/pdu.h"

%include <luowaveradio/endianness.h>

//load generated python docstrings
%include "blocks_swig6_doc.i"

%{
#include "luowaveradio/blocks/tag_gate.h"
#include "luowaveradio/blocks/tag_share.h"
#include "luowaveradio/blocks/tagged_stream_align.h"
#include "luowaveradio/blocks/tagged_stream_mux.h"
#include "luowaveradio/blocks/tagged_stream_multiply_length.h"
#include "luowaveradio/blocks/tagged_stream_to_pdu.h"
#include "luowaveradio/blocks/tags_strobe.h"
#include "luowaveradio/blocks/tcp_server_sink.h"
#include "luowaveradio/blocks/test_tag_variable_rate_ff.h"
#include "luowaveradio/blocks/threshold_ff.h"
#include "luowaveradio/blocks/transcendental.h"
#include "luowaveradio/blocks/tuntap_pdu.h"
#include "luowaveradio/blocks/uchar_to_float.h"
#include "luowaveradio/blocks/udp_sink.h"
#include "luowaveradio/blocks/udp_source.h"
#include "luowaveradio/blocks/unpack_k_bits.h"
#include "luowaveradio/blocks/unpack_k_bits_bb.h"
#include "luowaveradio/blocks/unpacked_to_packed.h"
#include "luowaveradio/blocks/vco_f.h"
#include "luowaveradio/blocks/vco_c.h"
#include "luowaveradio/blocks/xor_blk.h"
%}

%include "luowaveradio/blocks/tag_gate.h"
%include "luowaveradio/blocks/tag_share.h"
%include "luowaveradio/blocks/tagged_stream_align.h"
%include "luowaveradio/blocks/tagged_stream_mux.h"
%include "luowaveradio/blocks/tagged_stream_multiply_length.h"
%include "luowaveradio/blocks/tagged_stream_to_pdu.h"
%include "luowaveradio/blocks/tags_strobe.h"
%include "luowaveradio/blocks/tcp_server_sink.h"
%include "luowaveradio/blocks/test_tag_variable_rate_ff.h"
%include "luowaveradio/blocks/threshold_ff.h"
%include "luowaveradio/blocks/transcendental.h"
%include "luowaveradio/blocks/tuntap_pdu.h"
%include "luowaveradio/blocks/uchar_to_float.h"
%include "luowaveradio/blocks/udp_sink.h"
%include "luowaveradio/blocks/udp_source.h"
%include "luowaveradio/blocks/unpack_k_bits.h"
%include "luowaveradio/blocks/unpack_k_bits_bb.h"
%include "luowaveradio/blocks/unpacked_to_packed.h"
%include "luowaveradio/blocks/vco_f.h"
%include "luowaveradio/blocks/vco_c.h"
%include "luowaveradio/blocks/xor_blk.h"

GR_SWIG_BLOCK_MAGIC2(blocks, tag_gate);
GR_SWIG_BLOCK_MAGIC2(blocks, tag_share);
GR_SWIG_BLOCK_MAGIC2(blocks, tagged_stream_align);
GR_SWIG_BLOCK_MAGIC2(blocks, tagged_stream_mux);
GR_SWIG_BLOCK_MAGIC2(blocks, tagged_stream_multiply_length);
GR_SWIG_BLOCK_MAGIC2(blocks, tagged_stream_to_pdu);
GR_SWIG_BLOCK_MAGIC2(blocks, tags_strobe);
GR_SWIG_BLOCK_MAGIC2(blocks, tcp_server_sink);
GR_SWIG_BLOCK_MAGIC2(blocks, test_tag_variable_rate_ff);
GR_SWIG_BLOCK_MAGIC2(blocks, threshold_ff);
GR_SWIG_BLOCK_MAGIC2(blocks, transcendental);
GR_SWIG_BLOCK_MAGIC2(blocks, tuntap_pdu);
GR_SWIG_BLOCK_MAGIC2(blocks, uchar_to_float);
GR_SWIG_BLOCK_MAGIC2(blocks, udp_sink);
GR_SWIG_BLOCK_MAGIC2(blocks, udp_source);
GR_SWIG_BLOCK_MAGIC2(blocks, unpack_k_bits_bb);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, unpacked_to_packed_bb, unpacked_to_packed<std::uint8_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, unpacked_to_packed_ss, unpacked_to_packed<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, unpacked_to_packed_ii, unpacked_to_packed<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2(blocks, vco_f);
GR_SWIG_BLOCK_MAGIC2(blocks, vco_c);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, xor_bb, xor_blk<std::uint8_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, xor_ss, xor_blk<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, xor_ii, xor_blk<std::int32_t>);
