# Copyright 2012-2014,2018-2019 Free Software Foundation, Inc.
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
# Setup compatibility checks and defines
########################################################################
include(${CMAKE_CURRENT_SOURCE_DIR}/ConfigChecks.cmake)

########################################################################
# Setup library
########################################################################
add_library(luowaveradio-blocks
    abs_blk_impl.cc
    add_blk_impl.cc
    add_const_v_impl.cc
    and_blk_impl.cc
    and_const_impl.cc
    argmax_impl.cc
    divide_impl.cc
    integrate_impl.cc
    max_blk_impl.cc
    min_blk_impl.cc
    moving_average_impl.cc
    multiply_const_impl.cc
    multiply_impl.cc
    mute_impl.cc
    not_blk_impl.cc
    packed_to_unpacked_impl.cc
    peak_detector_impl.cc
    probe_signal_impl.cc
    probe_signal_v_impl.cc
    sample_and_hold_impl.cc
    selector_impl.cc
    sub_impl.cc
    tsb_vector_sink_impl.cc
    unpacked_to_packed_impl.cc
    vector_insert_impl.cc
    vector_sink_impl.cc
    vector_source_impl.cc
    xor_blk_impl.cc
    or_blk_impl.cc
    control_loop.cc
    count_bits.cc
    file_sink_base.cc
    pack_k_bits.cc
    unpack_k_bits.cc
    wavfile.cc
    add_const_bb_impl.cc
    add_const_ss_impl.cc
    add_const_ii_impl.cc
    add_const_ff_impl.cc
    add_const_cc_impl.cc
    annotator_1to1_impl.cc
    annotator_alltoall_impl.cc
    annotator_raw_impl.cc
    bin_statistics_f_impl.cc
    burst_tagger_impl.cc
    char_to_float_impl.cc
    char_to_short_impl.cc
    check_lfsr_32k_s_impl.cc
    complex_to_interleaved_char_impl.cc
    complex_to_interleaved_short_impl.cc
    complex_to_float_impl.cc
    complex_to_magphase_impl.cc
    complex_to_real_impl.cc
    complex_to_imag_impl.cc
    complex_to_mag_impl.cc
    complex_to_mag_squared_impl.cc
    complex_to_arg_impl.cc
    conjugate_cc_impl.cc
    copy_impl.cc
    deinterleave_impl.cc
    delay_impl.cc
    endian_swap_impl.cc
    exponentiate_const_cci_impl.cc
    file_descriptor_sink_impl.cc
    file_descriptor_source_impl.cc
    file_sink_impl.cc
    file_source_impl.cc
    file_meta_sink_impl.cc
    file_meta_source_impl.cc
    float_to_char_impl.cc
    float_to_complex_impl.cc
    magphase_to_complex_impl.cc
    float_array_to_int.cc
    float_to_int_impl.cc
    float_to_short_impl.cc
    float_array_to_uchar.cc
    float_to_uchar_impl.cc
    head_impl.cc
    int_to_float_impl.cc
    interleave_impl.cc
    interleaved_short_array_to_complex.cc
    interleaved_short_to_complex_impl.cc
    interleaved_char_to_complex_impl.cc
    keep_m_in_n_impl.cc
    keep_one_in_n_impl.cc
    lfsr_32k_source_s_impl.cc
    message_debug_impl.cc
    message_strobe_impl.cc
    message_strobe_random_impl.cc
    multiply_conjugate_cc_impl.cc
    multiply_const_v_impl.cc
    multiply_matrix_impl.cc
    multiply_by_tag_value_cc_impl.cc
    nlog10_ff_impl.cc
    nop_impl.cc
    null_sink_impl.cc
    null_source_impl.cc
    pack_k_bits_bb_impl.cc
    patterned_interleaver_impl.cc
    pdu.cc
    tag_debug_impl.cc
    pdu_filter_impl.cc
    pdu_set_impl.cc
    pdu_remove_impl.cc
    pdu_to_tagged_stream_impl.cc
    peak_detector2_fb_impl.cc
    random_pdu_impl.cc
    plateau_detector_fb_impl.cc
    probe_rate_impl.cc
    regenerate_bb_impl.cc
    repack_bits_bb_impl.cc
    repeat_impl.cc
    rms_cf_impl.cc
    rms_ff_impl.cc
    rotator_cc_impl.cc
    short_to_char_impl.cc
    short_to_float_impl.cc
    skiphead_impl.cc
    socket_pdu_impl.cc
    stream_mux_impl.cc
    stream_pdu_base.cc
    stream_to_streams_impl.cc
    stream_to_tagged_stream_impl.cc
    stream_to_vector_impl.cc
    streams_to_stream_impl.cc
    streams_to_vector_impl.cc
    stretch_ff_impl.cc
    tag_share_impl.cc
    tagged_file_sink_impl.cc
    tagged_stream_to_pdu_impl.cc
    tagged_stream_multiply_length_impl.cc
    tags_strobe_impl.cc
    test_tag_variable_rate_ff_impl.cc
    threshold_ff_impl.cc
    throttle_impl.cc
    transcendental_impl.cc
    tcp_connection.cc
    tcp_server_sink_impl.cc
    tuntap_pdu_impl.cc
    tag_gate_impl.cc
    tagged_stream_align_impl.cc
    tagged_stream_mux_impl.cc
    uchar_array_to_float.cc
    uchar_to_float_impl.cc
    udp_sink_impl.cc
    udp_source_impl.cc
    unpack_k_bits_bb_impl.cc
    vco_f_impl.cc
    vco_c_impl.cc
    vector_map_impl.cc
    vector_to_stream_impl.cc
    vector_to_streams_impl.cc
    wavfile_sink_impl.cc
    wavfile_source_impl.cc
    )

target_link_libraries(luowaveradio-blocks
  luowaveradio-runtime
  ${GR_VOLK_LIB}
  )

target_include_directories(luowaveradio-blocks
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
  )

set_source_files_properties(file_source_impl.cc PROPERTIES COMPILE_FLAGS -D_FILE_OFFSET_BITS=64)

if(ENABLE_GR_CTRLPORT)
target_sources(luowaveradio-blocks PRIVATE
  ctrlport_probe_c_impl.cc
  ctrlport_probe2_c_impl.cc
  ctrlport_probe2_f_impl.cc
  ctrlport_probe2_s_impl.cc
  ctrlport_probe2_i_impl.cc
  ctrlport_probe2_b_impl.cc
)
endif()

#Add Windows DLL resource file if using MSVC
IF(MSVC)
    include(${CMAKE_SOURCE_DIR}/cmake/Modules/GrVersion.cmake)

    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-blocks.rc.in
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-blocks.rc
    @ONLY)

    target_sources(luowaveradio-blocks PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-blocks.rc
    )
ENDIF(MSVC)

if(BUILD_SHARED_LIBS)
  GR_LIBRARY_FOO(luowaveradio-blocks)
endif()

########################################################################
# QA C++ Code for gr-blocks
########################################################################
if(ENABLE_TESTING)
  include(GrTest)

  list(APPEND test_gr_blocks_sources
    qa_block_tags.cc
    qa_gr_block.cc
    qa_gr_flowgraph.cc
    qa_gr_hier_block2.cc
    qa_gr_hier_block2_derived.cc
    qa_gr_top_block.cc
    qa_rotator.cc
    qa_set_msg_handler.cc
  )
  list(APPEND GR_TEST_TARGET_DEPS luowaveradio-blocks
  )

  foreach(qa_file ${test_gr_blocks_sources})
    GR_ADD_CPP_TEST("blocks_${qa_file}"
      ${CMAKE_CURRENT_SOURCE_DIR}/${qa_file}
    )
  endforeach(qa_file)

endif(ENABLE_TESTING)
