/* -*- c++ -*- */
/*
 * Copyright 2006,2011,2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_FFT_GOERTZEL_FC_IMPL_H
#define INCLUDED_FFT_GOERTZEL_FC_IMPL_H

#include <luowaveradio/fft/goertzel.h>
#include <luowaveradio/fft/goertzel_fc.h>

namespace gr {
namespace fft {

class FFT_API goertzel_fc_impl : public goertzel_fc
{
private:
    goertzel d_goertzel;
    int d_len;
    float d_freq;
    int d_rate;

public:
    goertzel_fc_impl(int rate, int len, float freq);

    ~goertzel_fc_impl();

    void set_freq(float freq);
    void set_rate(int rate);

    float freq() { return d_freq; }
    int rate() { return d_rate; }

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace fft */
} /* namespace gr */

#endif /* INCLUDED_FFT_GOERTZEL_FC_IMPL_H */
