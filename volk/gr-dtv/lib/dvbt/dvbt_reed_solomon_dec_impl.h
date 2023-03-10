/* -*- c++ -*- */
/*
 * Copyright 2015,2016 Free Software Foundation, Inc.
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

#ifndef INCLUDED_DTV_DVBT_REED_SOLOMON_DEC_IMPL_H
#define INCLUDED_DTV_DVBT_REED_SOLOMON_DEC_IMPL_H

#include <luowaveradio/dtv/dvbt_reed_solomon_dec.h>

extern "C" {
#include <luowaveradio/fec/rs.h>
}

namespace gr {
namespace dtv {

class dvbt_reed_solomon_dec_impl : public dvbt_reed_solomon_dec
{
private:
    int d_n;
    int d_k;
    int d_s;
    int d_blocks;

    int d_nerrors_corrected_count;
    int d_bad_packet_count;
    int d_total_packets;

    void* d_rs; /* Reed-Solomon characteristics structure */
    int decode(unsigned char& out, const unsigned char& in);

public:
    dvbt_reed_solomon_dec_impl(
        int p, int m, int gfpoly, int n, int k, int t, int s, int blocks);
    ~dvbt_reed_solomon_dec_impl();

    void forecast(int noutput_items, gr_vector_int& ninput_items_required);

    int general_work(int noutput_items,
                     gr_vector_int& ninput_items,
                     gr_vector_const_void_star& input_items,
                     gr_vector_void_star& output_items);
};

} // namespace dtv
} // namespace gr

#endif /* INCLUDED_DTV_DVBT_REED_SOLOMON_DEC_IMPL_H */
