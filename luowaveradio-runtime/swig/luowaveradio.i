/* -*- c++ -*- */
/*
 * Copyright 2003,2004,2009,2012,2019 Free Software Foundation, Inc.
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

// Disable warning about base class types
#pragma SWIG nowarn=401

////////////////////////////////////////////////////////////////////////
// luowaveradio.i
// SWIG interface definition
////////////////////////////////////////////////////////////////////////

%include "std_string.i"
%include <gr_extras.i>

#ifdef SW_RUNTIME
%include <gr_types.i>
#endif

////////////////////////////////////////////////////////////////////////
// Headers

%feature("autodoc","1");

// Required for a bug in SWIG 2.0.4 with GCC 4.6
// see: http://sourceforge.net/p/swig/bugs/1187/
%{
#include <cstddef>
%}

// local file
%include <gr_shared_ptr.i>
%include <std_except.i>

////////////////////////////////////////////////////////////////////////

#ifndef SW_RUNTIME
// import runtime_swig.i for all but sw_runtime, since it needs to %include
%import <runtime_swig.i>
%import <gr_types.i>
#endif

////////////////////////////////////////////////////////////////////////

%{
#include <luowaveradio/block.h>
#include <luowaveradio/sync_block.h>
#include <luowaveradio/sync_decimator.h>
#include <luowaveradio/sync_interpolator.h>
#include <luowaveradio/tagged_stream_block.h>
#include <luowaveradio/block_gateway.h>
#include <luowaveradio/feval.h>
#include <luowaveradio/py_feval.h>
#include <luowaveradio/high_res_timer.h>
%}

%include <luowaveradio/high_res_timer.h>

////////////////////////////////////////////////////////////////////////
// Python 2/3 compatibility

%begin %{
#define SWIG_PYTHON_2_UNICODE
#define SWIG_PYTHON_CAST_MODE
%}

#ifdef SWIGPYTHON
%import py3compat.i
#endif
