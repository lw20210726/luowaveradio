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

#ifndef INCLUDED_FLOAT_TO_CHAR_IMPL_H
#define INCLUDED_FLOAT_TO_CHAR_IMPL_H

#include <luowaveradio/blocks/float_to_char.h>

namespace gr {
namespace blocks {

class BLOCKS_API float_to_char_impl : public float_to_char
{
    size_t d_vlen;
    float d_scale;

public:
    float_to_char_impl(size_t vlen, float scale);

    virtual float scale() const { return d_scale; }
    virtual void set_scale(float scale) { d_scale = scale; }

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace blocks */
} /* namespace gr */


#endif /* INCLUDED_FLOAT_TO_CHAR_IMPL_H */
