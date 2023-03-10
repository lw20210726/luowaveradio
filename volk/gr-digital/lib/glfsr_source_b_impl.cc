/* -*- c++ -*- */
/*
 * Copyright 2007,2010,2012,2016 Free Software Foundation, Inc.
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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "glfsr_source_b_impl.h"
#include <luowaveradio/io_signature.h>
#include <stdexcept>

namespace gr {
namespace digital {

glfsr_source_b::sptr
glfsr_source_b::make(unsigned int degree, bool repeat, uint32_t mask, uint32_t seed)
{
    return luowaveradio::get_initial_sptr(
        new glfsr_source_b_impl(degree, repeat, mask, seed));
}

glfsr_source_b_impl::glfsr_source_b_impl(unsigned int degree,
                                         bool repeat,
                                         uint32_t mask,
                                         uint32_t seed)
    : sync_block("glfsr_source_b",
                 io_signature::make(0, 0, 0),
                 io_signature::make(1, 1, sizeof(unsigned char))),
      d_repeat(repeat),
      d_index(0),
      d_length((((uint32_t)1) << degree) - 1)
{
    if (degree < 1 || degree > 32)
        throw std::runtime_error(
            "glfsr_source_b_impl: degree must be between 1 and 32 inclusive");

    if (mask == 0)
        mask = glfsr::glfsr_mask(degree);
    d_glfsr = new glfsr(mask, seed);
}

glfsr_source_b_impl::~glfsr_source_b_impl() { delete d_glfsr; }

uint32_t glfsr_source_b_impl::mask() const { return d_glfsr->mask(); }

int glfsr_source_b_impl::work(int noutput_items,
                              gr_vector_const_void_star& input_items,
                              gr_vector_void_star& output_items)
{
    char* out = (char*)output_items[0];
    if ((d_index > d_length) && d_repeat == false)
        return WORK_DONE; /* once through the sequence */

    int i;
    for (i = 0; i < noutput_items; i++) {
        out[i] = d_glfsr->next_bit();
        d_index++;
        if (d_index > d_length && d_repeat == false)
            break;
    }

    return i;
}

} /* namespace digital */
} /* namespace gr */
