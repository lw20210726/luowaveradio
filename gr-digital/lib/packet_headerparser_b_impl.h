/* -*- c++ -*- */
/* Copyright 2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_DIGITAL_PACKET_HEADERPARSER_B_IMPL_H
#define INCLUDED_DIGITAL_PACKET_HEADERPARSER_B_IMPL_H

#include <luowaveradio/digital/packet_headerparser_b.h>

namespace gr {
namespace digital {

class packet_headerparser_b_impl : public packet_headerparser_b
{
private:
    packet_header_default::sptr d_header_formatter;

    const pmt::pmt_t d_port;

public:
    packet_headerparser_b_impl(
        const gr::digital::packet_header_default::sptr& header_formatter);
    ~packet_headerparser_b_impl();

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} // namespace digital
} // namespace gr

#endif /* INCLUDED_DIGITAL_PACKET_HEADERPARSER_B_IMPL_H */
