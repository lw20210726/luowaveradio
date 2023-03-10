/* -*- c++ -*- */
/*
 * Copyright 2012,2014 Free Software Foundation, Inc.
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

#define FILTER_API

%include "luowaveradio.i"

//load generated python docstrings
%include "gr_filter_swig_doc.i"

%{
#include "luowaveradio/filter/firdes.h"
#include "luowaveradio/filter/pm_remez.h"
#include "luowaveradio/filter/dc_blocker_cc.h"
#include "luowaveradio/filter/dc_blocker_ff.h"
#include "luowaveradio/filter/filter_delay_fc.h"
#include "luowaveradio/filter/filterbank_vcvcf.h"
#include "luowaveradio/filter/fir_filter_blk.h"
#include "luowaveradio/filter/fft_filter_ccc.h"
#include "luowaveradio/filter/fft_filter_ccf.h"
#include "luowaveradio/filter/fft_filter_fff.h"
#include "luowaveradio/filter/mmse_interpolator_cc.h"
#include "luowaveradio/filter/mmse_interpolator_ff.h"
#include "luowaveradio/filter/mmse_resampler_cc.h"
#include "luowaveradio/filter/mmse_resampler_ff.h"
#include "luowaveradio/filter/freq_xlating_fir_filter.h"
#include "luowaveradio/filter/hilbert_fc.h"
#include "luowaveradio/filter/iir_filter_ffd.h"
#include "luowaveradio/filter/iir_filter_ccc.h"
#include "luowaveradio/filter/iir_filter_ccf.h"
#include "luowaveradio/filter/iir_filter_ccd.h"
#include "luowaveradio/filter/iir_filter_ccz.h"
#include "luowaveradio/filter/interp_fir_filter.h"
#include "luowaveradio/filter/pfb_arb_resampler_ccf.h"
#include "luowaveradio/filter/pfb_arb_resampler_ccc.h"
#include "luowaveradio/filter/pfb_arb_resampler_fff.h"
#include "luowaveradio/filter/pfb_channelizer_ccf.h"
#include "luowaveradio/filter/pfb_decimator_ccf.h"
#include "luowaveradio/filter/pfb_interpolator_ccf.h"
#include "luowaveradio/filter/pfb_synthesizer_ccf.h"
#include "luowaveradio/filter/rational_resampler_base.h"
#include "luowaveradio/filter/single_pole_iir_filter_cc.h"
#include "luowaveradio/filter/single_pole_iir_filter_ff.h"
%}

%include "luowaveradio/filter/firdes.h"
%include "luowaveradio/filter/pm_remez.h"
%include "luowaveradio/filter/dc_blocker_cc.h"
%include "luowaveradio/filter/dc_blocker_ff.h"
%include "luowaveradio/filter/filter_delay_fc.h"
%include "luowaveradio/filter/filterbank_vcvcf.h"
%include "luowaveradio/filter/fir_filter_blk.h"
%include "luowaveradio/filter/fft_filter_ccc.h"
%include "luowaveradio/filter/fft_filter_ccf.h"
%include "luowaveradio/filter/fft_filter_fff.h"
%include "luowaveradio/filter/mmse_interpolator_cc.h"
%include "luowaveradio/filter/mmse_interpolator_ff.h"
%include "luowaveradio/filter/mmse_resampler_cc.h"
%include "luowaveradio/filter/mmse_resampler_ff.h"
%include "luowaveradio/filter/freq_xlating_fir_filter.h"
%include "luowaveradio/filter/hilbert_fc.h"
%include "luowaveradio/filter/iir_filter_ffd.h"
%include "luowaveradio/filter/iir_filter_ccc.h"
%include "luowaveradio/filter/iir_filter_ccf.h"
%include "luowaveradio/filter/iir_filter_ccd.h"
%include "luowaveradio/filter/iir_filter_ccz.h"
%include "luowaveradio/filter/interp_fir_filter.h"
%include "luowaveradio/filter/pfb_arb_resampler_ccf.h"
%include "luowaveradio/filter/pfb_arb_resampler_ccc.h"
%include "luowaveradio/filter/pfb_arb_resampler_fff.h"
%include "luowaveradio/filter/pfb_channelizer_ccf.h"
%include "luowaveradio/filter/pfb_decimator_ccf.h"
%include "luowaveradio/filter/pfb_interpolator_ccf.h"
%include "luowaveradio/filter/pfb_synthesizer_ccf.h"
%include "luowaveradio/filter/rational_resampler_base.h"
%include "luowaveradio/filter/single_pole_iir_filter_cc.h"
%include "luowaveradio/filter/single_pole_iir_filter_ff.h"

GR_SWIG_BLOCK_MAGIC2(filter, dc_blocker_cc);
GR_SWIG_BLOCK_MAGIC2(filter, dc_blocker_ff);
GR_SWIG_BLOCK_MAGIC2(filter, filter_delay_fc);
GR_SWIG_BLOCK_MAGIC2(filter, filterbank_vcvcf);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_ccc, fir_filter_blk<gr_complex, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_ccf, fir_filter_blk<gr_complex, gr_complex, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_fcc, fir_filter_blk<float, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_fff, fir_filter_blk<float, float, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_fsf, fir_filter_blk<float, std::int16_t, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, fir_filter_scc, fir_filter_blk<std::int16_t, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2(filter, fft_filter_ccc);
GR_SWIG_BLOCK_MAGIC2(filter, fft_filter_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, fft_filter_fff);
GR_SWIG_BLOCK_MAGIC2(filter, mmse_interpolator_cc);
GR_SWIG_BLOCK_MAGIC2(filter, mmse_interpolator_ff);
GR_SWIG_BLOCK_MAGIC2(filter, mmse_resampler_cc);
GR_SWIG_BLOCK_MAGIC2(filter, mmse_resampler_ff);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_ccc, freq_xlating_fir_filter<gr_complex, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_ccf, freq_xlating_fir_filter<gr_complex, gr_complex, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_fcc, freq_xlating_fir_filter<float, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_fcf, freq_xlating_fir_filter<float, gr_complex, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_scf, freq_xlating_fir_filter<std::int16_t, gr_complex, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, freq_xlating_fir_filter_scc, freq_xlating_fir_filter<std::int16_t, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2(filter, hilbert_fc);
GR_SWIG_BLOCK_MAGIC2(filter, iir_filter_ffd);
GR_SWIG_BLOCK_MAGIC2(filter, iir_filter_ccc);
GR_SWIG_BLOCK_MAGIC2(filter, iir_filter_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, iir_filter_ccd);
GR_SWIG_BLOCK_MAGIC2(filter, iir_filter_ccz);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_ccc, interp_fir_filter<gr_complex, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_ccf, interp_fir_filter<gr_complex, gr_complex, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_fcc, interp_fir_filter<float, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_fff, interp_fir_filter<float, float, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_fsf, interp_fir_filter<float, std::int16_t, float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, interp_fir_filter_scc, interp_fir_filter<std::int16_t, gr_complex, gr_complex>);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_arb_resampler_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_arb_resampler_ccc);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_arb_resampler_fff);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_channelizer_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_decimator_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_interpolator_ccf);
GR_SWIG_BLOCK_MAGIC2(filter, pfb_synthesizer_ccf);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_ccc, rational_resampler_base<gr_complex,gr_complex,gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_ccf, rational_resampler_base<gr_complex,gr_complex,float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_fcc, rational_resampler_base<float,gr_complex,gr_complex>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_fff, rational_resampler_base<float,float,float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_fsf, rational_resampler_base<float,std::int16_t,float>);
GR_SWIG_BLOCK_MAGIC2_TMPL(filter, rational_resampler_base_scc, rational_resampler_base<std::int16_t,gr_complex,gr_complex>);
GR_SWIG_BLOCK_MAGIC2(filter, single_pole_iir_filter_cc);
GR_SWIG_BLOCK_MAGIC2(filter, single_pole_iir_filter_ff);
