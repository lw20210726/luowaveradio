/* -*- c++ -*- */
/*
 * Copyright 2004,2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_FILTER_HILBERT_FC_IMPL_H
#define INCLUDED_FILTER_HILBERT_FC_IMPL_H

#include <luowaveradio/filter/fir_filter.h>
#include <luowaveradio/filter/hilbert_fc.h>
#include <luowaveradio/types.h>

namespace gr {
namespace filter {

class FILTER_API hilbert_fc_impl : public hilbert_fc
{
private:
    unsigned int d_ntaps;
    kernel::fir_filter_fff* d_hilb;

public:
    hilbert_fc_impl(unsigned int ntaps,
                    firdes::win_type window = firdes::WIN_HAMMING,
                    double beta = 6.76);

    ~hilbert_fc_impl();

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace filter */
} /* namespace gr */

#endif /* INCLUDED_FILTER_HILBERT_FC_IMPL_H */
