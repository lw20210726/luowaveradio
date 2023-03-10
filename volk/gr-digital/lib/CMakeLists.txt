# Copyright (C) 2011-2016,2017,2019 Free Software Foundation, Inc.
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

add_library(luowaveradio-digital
    additive_scrambler_bb_impl.cc
    binary_slicer_fb_impl.cc
    burst_shaper_impl.cc
    chunks_to_symbols_impl.cc
    clock_recovery_mm_cc_impl.cc
    clock_recovery_mm_ff_impl.cc
    clock_tracking_loop.cc
    cma_equalizer_cc_impl.cc
    constellation.cc
    constellation_decoder_cb_impl.cc
    constellation_receiver_cb_impl.cc
    constellation_soft_decoder_cf_impl.cc
    corr_est_cc_impl.cc
    correlate_access_code_bb_impl.cc
    correlate_access_code_tag_bb_impl.cc
    correlate_access_code_tag_ff_impl.cc
    correlate_access_code_bb_ts_impl.cc
    correlate_access_code_ff_ts_impl.cc
    costas_loop_cc_impl.cc
    cpmmod_bc_impl.cc
    crc32.cc
    crc32_bb_impl.cc
    crc32_async_bb_impl.cc
    descrambler_bb_impl.cc
    diff_decoder_bb_impl.cc
    diff_encoder_bb_impl.cc
    diff_phasor_cc_impl.cc
    fll_band_edge_cc_impl.cc
    framer_sink_1_impl.cc
    glfsr.cc
    glfsr_source_b_impl.cc
    glfsr_source_f_impl.cc
    hdlc_deframer_bp_impl.cc
    hdlc_framer_pb_impl.cc
    header_buffer.cc
    header_payload_demux_impl.cc
    kurtotic_equalizer_cc_impl.cc
    lms_dd_equalizer_cc_impl.cc
    map_bb_impl.cc
    modulate_vector.cc
    mpsk_snr_est.cc
    mpsk_snr_est_cc_impl.cc
    msk_timing_recovery_cc_impl.cc
    ofdm_carrier_allocator_cvc_impl.cc
    ofdm_chanest_vcvc_impl.cc
    ofdm_cyclic_prefixer_impl.cc
    ofdm_equalizer_base.cc
    ofdm_equalizer_simpledfe.cc
    ofdm_equalizer_static.cc
    ofdm_frame_equalizer_vcvc_impl.cc
    ofdm_serializer_vcc_impl.cc
    ofdm_sync_sc_cfb_impl.cc
    header_format_base.cc
    header_format_default.cc
    header_format_counter.cc
    header_format_crc.cc
    header_format_ofdm.cc
    protocol_formatter_async_impl.cc
    protocol_formatter_bb_impl.cc
    protocol_parser_b_impl.cc
    packet_header_default.cc
    packet_header_ofdm.cc
    packet_headergenerator_bb_impl.cc
    packet_headerparser_b_impl.cc
    packet_sink_impl.cc
    pfb_clock_sync_ccf_impl.cc
    pfb_clock_sync_fff_impl.cc
    pn_correlator_cc_impl.cc
    probe_density_b_impl.cc
    probe_mpsk_snr_est_c_impl.cc
    scrambler_bb_impl.cc
    simple_correlator_impl.cc
    simple_framer_impl.cc
    interpolating_resampler.cc
    symbol_sync_cc_impl.cc
    symbol_sync_ff_impl.cc
    timing_error_detector.cc
    )

target_link_libraries(luowaveradio-digital PUBLIC
    luowaveradio-runtime
    luowaveradio-filter
    luowaveradio-blocks
    luowaveradio-analog
    Boost::boost
    ${GR_VOLK_LIB}
)


target_include_directories(luowaveradio-digital
  PUBLIC $<INSTALL_INTERFACE:include>
  PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
  )

#Add Windows DLL resource file if using MSVC
IF(MSVC)
    include(${CMAKE_SOURCE_DIR}/cmake/Modules/GrVersion.cmake)

    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-digital.rc.in
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-digital.rc
    @ONLY)

    target_sources(luowaveradio-digital PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-digital.rc
    )
ENDIF(MSVC)

if(BUILD_SHARED_LIBS)
    GR_LIBRARY_FOO(luowaveradio-digital)
endif()

########################################################################
# QA C++ Code for gr-blocks
########################################################################
if(ENABLE_TESTING)
  include(GrTest)

  list(APPEND test_gr_digital_sources
    qa_header_format.cc
    qa_header_buffer.cc
  )
  list(APPEND GR_TEST_TARGET_DEPS luowaveradio-digital)

  foreach(qa_file ${test_gr_digital_sources})
    GR_ADD_CPP_TEST("digital_${qa_file}"
      ${CMAKE_CURRENT_SOURCE_DIR}/${qa_file}
    )
  endforeach(qa_file)
endif(ENABLE_TESTING)
