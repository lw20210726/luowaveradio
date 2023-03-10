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

//load generated python docstrings
%include "blocks_swig9_doc.i"

%{
#include "luowaveradio/blocks/float_to_char.h"
#include "luowaveradio/blocks/float_to_complex.h"
#include "luowaveradio/blocks/magphase_to_complex.h"
#include "luowaveradio/blocks/float_to_int.h"
#include "luowaveradio/blocks/float_to_short.h"
#include "luowaveradio/blocks/float_to_uchar.h"
#include "luowaveradio/blocks/int_to_float.h"
#include "luowaveradio/blocks/integrate.h"
#include "luowaveradio/blocks/interleave.h"
#include "luowaveradio/blocks/interleaved_short_to_complex.h"
#include "luowaveradio/blocks/interleaved_char_to_complex.h"
#include "luowaveradio/blocks/keep_m_in_n.h"
#include "luowaveradio/blocks/keep_one_in_n.h"
#include "luowaveradio/blocks/lfsr_32k_source_s.h"
#include "luowaveradio/blocks/max_blk.h"
%}

%include "luowaveradio/blocks/float_to_char.h"
%include "luowaveradio/blocks/float_to_complex.h"
%include "luowaveradio/blocks/magphase_to_complex.h"
%include "luowaveradio/blocks/float_to_int.h"
%include "luowaveradio/blocks/float_to_short.h"
%include "luowaveradio/blocks/float_to_uchar.h"
%include "luowaveradio/blocks/int_to_float.h"
%include "luowaveradio/blocks/integrate.h"
%include "luowaveradio/blocks/interleave.h"
%include "luowaveradio/blocks/interleaved_short_to_complex.h"
%include "luowaveradio/blocks/interleaved_char_to_complex.h"
%include "luowaveradio/blocks/keep_m_in_n.h"
%include "luowaveradio/blocks/keep_one_in_n.h"
%include "luowaveradio/blocks/lfsr_32k_source_s.h"
%include "luowaveradio/blocks/max_blk.h"

GR_SWIG_BLOCK_MAGIC2(blocks, float_to_char);
GR_SWIG_BLOCK_MAGIC2(blocks, float_to_complex);
GR_SWIG_BLOCK_MAGIC2(blocks, magphase_to_complex);
GR_SWIG_BLOCK_MAGIC2(blocks, float_to_int);
GR_SWIG_BLOCK_MAGIC2(blocks, float_to_short);
GR_SWIG_BLOCK_MAGIC2(blocks, float_to_uchar);
GR_SWIG_BLOCK_MAGIC2(blocks, int_to_float);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, integrate_ss, integrate<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, integrate_ii, integrate<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, integrate_ff, integrate<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, integrate_cc, integrate<gr_complex>);
GR_SWIG_BLOCK_MAGIC2(blocks, interleave);
GR_SWIG_BLOCK_MAGIC2(blocks, interleaved_short_to_complex);
GR_SWIG_BLOCK_MAGIC2(blocks, interleaved_char_to_complex);
GR_SWIG_BLOCK_MAGIC2(blocks, keep_m_in_n);
GR_SWIG_BLOCK_MAGIC2(blocks, keep_one_in_n);
GR_SWIG_BLOCK_MAGIC2(blocks, lfsr_32k_source_s);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, max_ff, max_blk<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, max_ii, max_blk<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(blocks, max_ss, max_blk<std::int16_t>);
