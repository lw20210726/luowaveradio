/*
 * Copyright 2012 Free Software Foundation, Inc.
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

#define ANALOG_API
#define BLOCKS_API

%include "luowaveradio.i"
%include "stdint.i"

//load generated python docstrings
%include "analog_swig_doc.i"

%{
#include <luowaveradio/blocks/control_loop.h>
%}
%include <luowaveradio/blocks/control_loop.h>

%{
#include "luowaveradio/analog/cpm.h"
#include "luowaveradio/analog/noise_type.h"
#include "luowaveradio/analog/agc_cc.h"
#include "luowaveradio/analog/agc_ff.h"
#include "luowaveradio/analog/agc2_cc.h"
#include "luowaveradio/analog/agc2_ff.h"
#include "luowaveradio/analog/agc3_cc.h"
#include "luowaveradio/analog/cpfsk_bc.h"
#include "luowaveradio/analog/ctcss_squelch_ff.h"
#include "luowaveradio/analog/dpll_bb.h"
#include "luowaveradio/analog/feedforward_agc_cc.h"
#include "luowaveradio/analog/fmdet_cf.h"
#include "luowaveradio/analog/frequency_modulator_fc.h"
#include "luowaveradio/analog/fastnoise_source.h"
#include "luowaveradio/analog/noise_source.h"
#include "luowaveradio/analog/phase_modulator_fc.h"
#include "luowaveradio/analog/pll_carriertracking_cc.h"
#include "luowaveradio/analog/pll_freqdet_cf.h"
#include "luowaveradio/analog/pll_refout_cc.h"
#include "luowaveradio/analog/probe_avg_mag_sqrd_c.h"
#include "luowaveradio/analog/probe_avg_mag_sqrd_cf.h"
#include "luowaveradio/analog/probe_avg_mag_sqrd_f.h"
#include "luowaveradio/analog/pwr_squelch_cc.h"
#include "luowaveradio/analog/pwr_squelch_ff.h"
#include "luowaveradio/analog/quadrature_demod_cf.h"
#include "luowaveradio/analog/rail_ff.h"
#include "luowaveradio/analog/sig_source.h"
#include "luowaveradio/analog/sig_source_waveform.h"
#include "luowaveradio/analog/simple_squelch_cc.h"
#include "luowaveradio/analog/squelch_base_cc.h"
#include "luowaveradio/analog/squelch_base_ff.h"
#include "luowaveradio/analog/random_uniform_source.h"
%}

%include "luowaveradio/analog/cpm.h"
%include "luowaveradio/analog/noise_type.h"
%include "luowaveradio/analog/agc_cc.h"
%include "luowaveradio/analog/agc_ff.h"
%include "luowaveradio/analog/agc2_cc.h"
%include "luowaveradio/analog/agc2_ff.h"
%include "luowaveradio/analog/agc3_cc.h"
%include "luowaveradio/analog/cpfsk_bc.h"
%include "luowaveradio/analog/ctcss_squelch_ff.h"
%include "luowaveradio/analog/dpll_bb.h"
%include "luowaveradio/analog/feedforward_agc_cc.h"
%include "luowaveradio/analog/fmdet_cf.h"
%include "luowaveradio/analog/frequency_modulator_fc.h"
%include "luowaveradio/analog/fastnoise_source.h"
%include "luowaveradio/analog/noise_source.h"
%include "luowaveradio/analog/phase_modulator_fc.h"
%include "luowaveradio/analog/pll_carriertracking_cc.h"
%include "luowaveradio/analog/pll_freqdet_cf.h"
%include "luowaveradio/analog/pll_refout_cc.h"
%include "luowaveradio/analog/probe_avg_mag_sqrd_c.h"
%include "luowaveradio/analog/probe_avg_mag_sqrd_cf.h"
%include "luowaveradio/analog/probe_avg_mag_sqrd_f.h"
%include "luowaveradio/analog/pwr_squelch_cc.h"
%include "luowaveradio/analog/pwr_squelch_ff.h"
%include "luowaveradio/analog/quadrature_demod_cf.h"
%include "luowaveradio/analog/rail_ff.h"
%include "luowaveradio/analog/sig_source.h"
%include "luowaveradio/analog/sig_source_waveform.h"
%include "luowaveradio/analog/simple_squelch_cc.h"
%include "luowaveradio/analog/squelch_base_cc.h"
%include "luowaveradio/analog/squelch_base_ff.h"
%include "luowaveradio/analog/random_uniform_source.h"

GR_SWIG_BLOCK_MAGIC2(analog, agc_cc);
GR_SWIG_BLOCK_MAGIC2(analog, agc_ff);
GR_SWIG_BLOCK_MAGIC2(analog, agc2_cc);
GR_SWIG_BLOCK_MAGIC2(analog, agc2_ff);
GR_SWIG_BLOCK_MAGIC2(analog, agc3_cc);
GR_SWIG_BLOCK_MAGIC2(analog, cpfsk_bc);
GR_SWIG_BLOCK_MAGIC2(analog, ctcss_squelch_ff);
GR_SWIG_BLOCK_MAGIC2(analog, dpll_bb);
GR_SWIG_BLOCK_MAGIC2(analog, feedforward_agc_cc);
GR_SWIG_BLOCK_MAGIC2(analog, fmdet_cf);
GR_SWIG_BLOCK_MAGIC2(analog, frequency_modulator_fc);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, fastnoise_source_s, fastnoise_source<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, fastnoise_source_i, fastnoise_source<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, fastnoise_source_f, fastnoise_source<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, fastnoise_source_c, fastnoise_source<gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, noise_source_s, noise_source<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, noise_source_i, noise_source<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, noise_source_f, noise_source<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, noise_source_c, noise_source<gr_complex>);
GR_SWIG_BLOCK_MAGIC2(analog, phase_modulator_fc);
GR_SWIG_BLOCK_MAGIC2(analog, pll_carriertracking_cc);
GR_SWIG_BLOCK_MAGIC2(analog, pll_freqdet_cf);
GR_SWIG_BLOCK_MAGIC2(analog, pll_refout_cc);
GR_SWIG_BLOCK_MAGIC2(analog, probe_avg_mag_sqrd_c);
GR_SWIG_BLOCK_MAGIC2(analog, probe_avg_mag_sqrd_cf);
GR_SWIG_BLOCK_MAGIC2(analog, probe_avg_mag_sqrd_f);
GR_SWIG_BLOCK_MAGIC2(analog, pwr_squelch_cc);
GR_SWIG_BLOCK_MAGIC2(analog, pwr_squelch_ff);
GR_SWIG_BLOCK_MAGIC2(analog, quadrature_demod_cf);
GR_SWIG_BLOCK_MAGIC2(analog, rail_ff);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, sig_source_b, sig_source<std::int8_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, sig_source_s, sig_source<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, sig_source_i, sig_source<std::int32_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, sig_source_f, sig_source<float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, sig_source_c, sig_source<gr_complex>);
GR_SWIG_BLOCK_MAGIC2(analog, simple_squelch_cc);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, random_uniform_source_b, random_uniform_source<std::uint8_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, random_uniform_source_s, random_uniform_source<std::int16_t>);
GR_SWIG_BLOCK_MAGIC2_TMPL(analog, random_uniform_source_i, random_uniform_source<std::int32_t>);
