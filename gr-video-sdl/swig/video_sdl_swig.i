/* -*- c++ -*- */
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

#define VIDEO_SDL_API

%include "luowaveradio.i"

//load generated python docstrings
%include "video_sdl_swig_doc.i"

%{
#include "luowaveradio/video_sdl/sink_uc.h"
#include "luowaveradio/video_sdl/sink_s.h"
%}

%include "luowaveradio/video_sdl/sink_uc.h"
%include "luowaveradio/video_sdl/sink_s.h"

GR_SWIG_BLOCK_MAGIC2(video_sdl, sink_uc);
GR_SWIG_BLOCK_MAGIC2(video_sdl, sink_s);
