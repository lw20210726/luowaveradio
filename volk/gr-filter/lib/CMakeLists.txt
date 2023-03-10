# Copyright (C) 2012-2014,2017-2019 Free Software Foundation, Inc.
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
# Setup library
########################################################################
add_library(luowaveradio-filter
  fir_filter.cc
  fir_filter_blk_impl.cc
  fir_filter_with_buffer.cc
  fft_filter.cc
  firdes.cc
  freq_xlating_fir_filter_impl.cc
  iir_filter.cc
  interp_fir_filter_impl.cc
  mmse_fir_interpolator_cc.cc
  mmse_fir_interpolator_ff.cc
  mmse_interp_differentiator_cc.cc
  mmse_interp_differentiator_ff.cc
  pm_remez.cc
  polyphase_filterbank.cc
  dc_blocker_cc_impl.cc
  dc_blocker_ff_impl.cc
  filter_delay_fc_impl.cc
  filterbank.cc
  filterbank_vcvcf_impl.cc
  fft_filter_ccc_impl.cc
  fft_filter_ccf_impl.cc
  fft_filter_fff_impl.cc
  mmse_interpolator_cc_impl.cc
  mmse_interpolator_ff_impl.cc
  mmse_resampler_cc_impl.cc
  mmse_resampler_ff_impl.cc
  hilbert_fc_impl.cc
  iir_filter_ffd_impl.cc
  iir_filter_ccc_impl.cc
  iir_filter_ccf_impl.cc
  iir_filter_ccd_impl.cc
  iir_filter_ccz_impl.cc
  pfb_arb_resampler.cc
  pfb_arb_resampler_ccf_impl.cc
  pfb_arb_resampler_ccc_impl.cc
  pfb_arb_resampler_fff_impl.cc
  pfb_channelizer_ccf_impl.cc
  pfb_decimator_ccf_impl.cc
  pfb_interpolator_ccf_impl.cc
  pfb_synthesizer_ccf_impl.cc
  rational_resampler_base_impl.cc
  single_pole_iir_filter_cc_impl.cc
  single_pole_iir_filter_ff_impl.cc
)

target_link_libraries(luowaveradio-filter PUBLIC
    luowaveradio-runtime
    luowaveradio-fft
    luowaveradio-blocks
    ${GR_VOLK_LIB}
)

target_include_directories(luowaveradio-filter
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
  )

#Add Windows DLL resource file if using MSVC
if(MSVC)
    include(${CMAKE_SOURCE_DIR}/cmake/Modules/GrVersion.cmake)

    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-filter.rc.in
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-filter.rc
    @ONLY)

    target_sources(luowaveradio-filter PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-filter.rc
    )
endif(MSVC)

GR_LIBRARY_FOO(luowaveradio-filter)

########################################################################
# QA C++ Code for gr-filter
########################################################################
if(ENABLE_TESTING)
  include(GrTest)

  list(APPEND test_gr_filter_sources
    qa_firdes.cc
    qa_fir_filter_with_buffer.cc
    qa_mmse_fir_interpolator_cc.cc
    qa_mmse_fir_interpolator_ff.cc
    qa_mmse_interp_differentiator_cc.cc
    qa_mmse_interp_differentiator_ff.cc
  )
  list(APPEND GR_TEST_TARGET_DEPS luowaveradio-filter luowaveradio-fft)

  foreach(qa_file ${test_gr_filter_sources})
    GR_ADD_CPP_TEST("filter_${qa_file}"
      ${CMAKE_CURRENT_SOURCE_DIR}/${qa_file}
    )
  endforeach(qa_file)
endif(ENABLE_TESTING)
