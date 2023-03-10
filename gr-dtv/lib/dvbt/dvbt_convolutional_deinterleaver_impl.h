/* -*- c++ -*- */
/*
 * Copyright 2015 Free Software Foundation, Inc.
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifndef INCLUDED_DTV_DVBT_CONVOLUTIONAL_DEINTERLEAVER_IMPL_H
#define INCLUDED_DTV_DVBT_CONVOLUTIONAL_DEINTERLEAVER_IMPL_H

#include <luowaveradio/dtv/dvbt_convolutional_deinterleaver.h>

namespace gr {
namespace dtv {

class dvbt_convolutional_deinterleaver_impl : public dvbt_convolutional_deinterleaver
{
private:
    static const int d_SYNC;
    static const int d_NSYNC;
    static const int d_MUX_PKT;

    int d_blocks;
    int d_I;
    int d_M;
    std::vector<std::deque<unsigned char>*> d_shift;

public:
    dvbt_convolutional_deinterleaver_impl(int nsize, int I, int M);
    ~dvbt_convolutional_deinterleaver_impl();

    void forecast(int noutput_items, gr_vector_int& ninput_items_required);

    int general_work(int noutput_items,
                     gr_vector_int& ninput_items,
                     gr_vector_const_void_star& input_items,
                     gr_vector_void_star& output_items);
};

} // namespace dtv
} // namespace gr

#endif /* INCLUDED_DTV_DVBT_CONVOLUTIONAL_DEINTERLEAVER_IMPL_H */
