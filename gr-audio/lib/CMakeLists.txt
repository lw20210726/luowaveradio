# Copyright 2011,2013 Free Software Foundation, Inc.
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

include(GrComponent)

########################################################################
# Setup library
########################################################################
add_library(luowaveradio-audio audio_registry.cc)
target_link_libraries(luowaveradio-audio PUBLIC luowaveradio-runtime)
target_include_directories(luowaveradio-audio
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
  )

list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/gr-audio.conf)

########################################################################
## ALSA Support
########################################################################
find_package(ALSA)

set(audio_deps "")

if((ALSA_FOUND) AND NOT (CMAKE_SYSTEM_NAME STREQUAL "kFreeBSD") AND NOT (CMAKE_SYSTEM_NAME STREQUAL GNU))
    target_compile_definitions(luowaveradio-audio PRIVATE -DALSA_FOUND)
    target_link_libraries(luowaveradio-audio PUBLIC ALSA::ALSA)
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/alsa/alsa_impl.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/alsa/alsa_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/alsa/alsa_sink.cc
        )

    gr_append_subcomponent("alsa")
    list(APPEND audio_deps "ALSA")
    list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/alsa/gr-audio-alsa.conf)
endif()

########################################################################
## OSS Support
########################################################################
find_package(OSS)

if(OSS_FOUND)
    target_compile_definitions(luowaveradio-audio PRIVATE -DOSS_FOUND)
    target_link_libraries(luowaveradio-audio PUBLIC OSS::OSS)
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/oss/oss_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/oss/oss_sink.cc
        )

    gr_append_subcomponent("oss")
    list(APPEND audio_deps "OSS")
    list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/oss/gr-audio-oss.conf)
endif(OSS_FOUND)


########################################################################
## Jack Support
########################################################################
find_package(JACK)

if(JACK_FOUND)
    target_compile_definitions(luowaveradio-audio PRIVATE -DJACK_FOUND)
    target_link_libraries(luowaveradio-audio PUBLIC JACK::JACK)
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/jack/jack_impl.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/jack/jack_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/jack/jack_sink.cc
    )
    gr_append_subcomponent("jack")
    list(APPEND audio_deps "JACK")
    list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/jack/gr-audio-jack.conf)
endif(JACK_FOUND)

########################################################################
## OSX Support
########################################################################
include(CheckIncludeFileCXX)
check_include_file_cxx(AudioUnit/AudioUnit.h AUDIO_UNIT_H)
check_include_file_cxx(AudioToolbox/AudioToolbox.h AUDIO_TOOLBOX_H)

if(AUDIO_UNIT_H AND AUDIO_TOOLBOX_H)
    target_compile_definitions(luowaveradio-audio PRIVATE -DOSX_FOUND)
    target_link_libraries(luowaveradio-audio
      PUBLIC
        "-framework AudioUnit"
        "-framework CoreAudio"
        "-framework AudioToolbox"
        "-framework Carbon"
     )
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/osx/osx_impl.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/osx/osx_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/osx/osx_sink.cc
    )

    gr_append_subcomponent("osx")
    set(OSX_AUDIO_VALID 1 CACHE INTERNAL "OSX Audio is valid")
    list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/osx/gr-audio-osx.conf)
else()
    set(OSX_AUDIO_VALID 0 CACHE INTERNAL "OSX Audio is not valid")
endif()

########################################################################
## PortAudio Support
########################################################################
find_package(PORTAUDIO)

if(PORTAUDIO2_FOUND)
    target_compile_definitions(luowaveradio-audio PRIVATE -DPORTAUDIO_FOUND)
    target_link_libraries(luowaveradio-audio PUBLIC Portaudio::Portaudio)
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/portaudio/portaudio_impl.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/portaudio/portaudio_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/portaudio/portaudio_sink.cc
    )
    list(APPEND audio_deps "PORTAUDIO")
    gr_append_subcomponent("portaudio")
    list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/portaudio/gr-audio-portaudio.conf)
endif(PORTAUDIO2_FOUND)

########################################################################
## Windows Support
########################################################################
if(WIN32)
    target_compile_definitions(luowaveradio-audio PRIVATE -DWIN32_FOUND)
    target_link_libraries(luowaveradio-audio PUBLIC winmm.lib)
    target_sources(luowaveradio-audio PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/windows/windows_source.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/windows/windows_sink.cc
    )
    gr_append_subcomponent("windows")
    #Add Windows DLL resource file if using MSVC
    if(MSVC)
        include(${CMAKE_SOURCE_DIR}/cmake/Modules/GrVersion.cmake)

        configure_file(
            ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradio-audio.rc.in
            ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-audio.rc
        @ONLY)

        target_sources(luowaveradio-audio PRIVATE
            ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio-audio.rc
        )
    endif()
endif(WIN32)

gr_library_foo(luowaveradio-audio ${audio_deps})
install(FILES ${gr_audio_confs} DESTINATION ${GR_PREFSDIR})
