/* -*- c++ -*- */
/*
 * Copyright 2013 Free Software Foundation, Inc.
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

#define GR_RUNTIME_API

#ifndef SWIGIMPORTED
%include "runtime_swig_doc.i"
%module(directors="1") runtime_swig
#endif

%feature("autodoc", "1");		// generate python docstrings

#define SW_RUNTIME
%include "luowaveradio.i"				// the common stuff

%{
#include <luowaveradio/runtime_types.h>
%}

%include <luowaveradio/runtime_types.h>

%{
#include <luowaveradio/block.h>
#include <luowaveradio/block_detail.h>
#include <luowaveradio/buffer.h>
#include <luowaveradio/constants.h>
#include <luowaveradio/endianness.h>
#include <luowaveradio/feval.h>
#include <luowaveradio/hier_block2.h>
#include <luowaveradio/io_signature.h>
#include <luowaveradio/message.h>
#include <luowaveradio/msg_handler.h>
#include <luowaveradio/msg_queue.h>
#include <luowaveradio/prefs.h>
#include <luowaveradio/realtime.h>
#include <luowaveradio/sync_block.h>
#include <luowaveradio/sync_decimator.h>
#include <luowaveradio/sync_interpolator.h>
#include <luowaveradio/tags.h>
#include <luowaveradio/tagged_stream_block.h>
#include <luowaveradio/top_block.h>
#include <luowaveradio/logger.h>
#include <luowaveradio/math.h>
#include <luowaveradio/random.h>
%}

%constant int sizeof_char 	= sizeof(char);
%constant int sizeof_short	= sizeof(short);
%constant int sizeof_int	= sizeof(int);
%constant int sizeof_float	= sizeof(float);
%constant int sizeof_double	= sizeof(double);
%constant int sizeof_gr_complex	= sizeof(gr_complex);

%include <luowaveradio/endianness.h>
%include "basic_block.i"
%include "block.i"
%include "block_detail.i"
%include "buffer.i"
%include "constants.i"
%include "feval.i"
%include "hier_block2.i"
%include "io_signature.i"
%include "message.i"
%include "msg_handler.i"
%include "msg_queue.i"
%include "prefs.i"
%include "realtime.i"
%include "sync_block.i"
%include "sync_decimator.i"
%include "sync_interpolator.i"
%include "tagged_stream_block.i"
%include "tags.i"
%include "top_block.i"
%include "block_gateway.i"
%include "gr_logger.i"
%include "gr_swig_block_magic.i"
%include "gr_ctrlport.i"

%include "luowaveradio/math.h"
%include "luowaveradio/random.h"
