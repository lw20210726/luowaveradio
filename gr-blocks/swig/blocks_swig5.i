/* -*- c++ -*- */
/*
 * Copyright 2012-2013 Free Software Foundation, Inc.
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
%include "blocks_swig5_doc.i"

%{
#include "luowaveradio/blocks/pdu.h"
#include "luowaveradio/blocks/random_pdu.h"
#include "luowaveradio/blocks/regenerate_bb.h"
#include "luowaveradio/blocks/repack_bits_bb.h"
#include "luowaveradio/blocks/repeat.h"
#include "luowaveradio/blocks/rms_cf.h"
#include "luowaveradio/blocks/rms_ff.h"
#include "luowaveradio/blocks/rotator_cc.h"
#include "luowaveradio/blocks/sample_and_hold.h"
#include "luowaveradio/blocks/short_to_char.h"
#include "luowaveradio/blocks/short_to_float.h"
#include "luowaveradio/blocks/socket_pdu.h"
#include "luowaveradio/blocks/stretch_ff.h"
#include "luowaveradio/blocks/sub.h"
%}

%include "luowaveradio/blocks/random_pdu.h"
%include "luowaveradio/blocks/regenerate_bb.h"
%include "luowaveradio/blocks/repack_bits_bb.h"
%include "luowaveradio/blocks/repeat.h"
%include "luowaveradio/blocks/rms_cf.h"
%include "luowaveradio/blocks/rms_ff.h"
%include "luowaveradio/blocks/rotator_cc.h"
%include "luowaveradio/blocks/sample_and_hold.h"
%include "luowaveradio/blocks/short_to_char.h"
%include "luowaveradio/blocks/short_to_float.h"
%include "luowaveradio/blocks/socket_pdu.h"
%include "luowaveradio/blocks/stretch_ff.h"
%include "luowaveradio/blocks/sub.h"

GR_SWIG_BLOCK_MAGIC2(blocks, random_pdu);
GR_SWIG_BLOCK_MAGIC2(blocks, regenerate_bb);
GR_SWIG_BLOCK_MAGIC2(blocks, repack_bits_bb);
GR_SWIG_BLOCK_MAGIC2(blocks, repeat);
GR_SWIG_BLOCK_MAGIC2(blocks, rms_cf);
GR_SWIG_BLOCK_MAGIC2(blocks, rms_ff);
GR_SWIG_BLOCK_MAGIC2(blocks, rotator_cc);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sample_and_hold_bb, sample_and_hold<std::uint8_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sample_and_hold_ss, sample_and_hold<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sample_and_hold_ii, sample_and_hold<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sample_and_hold_ff, sample_and_hold<float>);
GR_SWIG_BLOCK_MAGIC2(blocks, short_to_char);
GR_SWIG_BLOCK_MAGIC2(blocks, short_to_float);
GR_SWIG_BLOCK_MAGIC2(blocks, socket_pdu);
GR_SWIG_BLOCK_MAGIC2(blocks, stretch_ff);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sub_ff, sub<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sub_ss, sub<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sub_ii, sub<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, sub_cc, sub<gr_complex>);
