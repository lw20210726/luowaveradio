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

#ifndef INCLUDED_CTRLPORT_PROBE2_B_IMPL_H
#define INCLUDED_CTRLPORT_PROBE2_B_IMPL_H

#include <luowaveradio/blocks/ctrlport_probe2_b.h>
#include <luowaveradio/rpcbufferedget.h>
#include <luowaveradio/rpcregisterhelpers.h>

namespace gr {
namespace blocks {

class ctrlport_probe2_b_impl : public ctrlport_probe2_b
{
private:
    std::string d_id;
    std::string d_desc;
    size_t d_len;
    unsigned int d_disp_mask;

    size_t d_index;
    std::vector<signed char> d_buffer;
    rpcbufferedget<std::vector<signed char>> buffered_get;

public:
    ctrlport_probe2_b_impl(const std::string& id,
                           const std::string& desc,
                           int len,
                           unsigned int disp_mask);
    ~ctrlport_probe2_b_impl();

    void setup_rpc();

    void forecast(int noutput_items, gr_vector_int& ninput_items_required);

    std::vector<signed char> get();

    void set_length(int len);
    int length() const;

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace blocks */
} /* namespace gr */

#endif /* INCLUDED_CTRLPORT_PROBE2_C_IMPL_H */
