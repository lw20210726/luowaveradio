/* -*- c++ -*- */
/*
 * Copyright 2006,2013,2018 Free Software Foundation, Inc.
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


#ifndef PACKED_TO_UNPACKED_H
#define PACKED_TO_UNPACKED_H

#include <luowaveradio/block.h>
#include <luowaveradio/blocks/api.h>
#include <luowaveradio/endianness.h>
#include <cstdint>

namespace gr {
namespace blocks {

/*!
 * \brief Convert a stream of packed bytes or shorts to stream of unpacked bytes or
 * shorts. \ingroup byte_operators_blk
 *
 * \details
 * input: stream of T; output: stream of T
 *
 * This is the inverse of gr::blocks::unpacked_to_packed_XX.
 *
 * The bits in the bytes or shorts input stream are grouped into
 * chunks of \p bits_per_chunk bits and each resulting chunk is
 * written right- justified to the output stream of bytes or
 * shorts. All b or 16 bits of the each input bytes or short are
 * processed. The right thing is done if bits_per_chunk is not a
 * power of two.
 *
 * The combination of gr::blocks::packed_to_unpacked_XX_ followed by
 * gr_chunks_to_symbols_Xf or gr_chunks_to_symbols_Xc handles the
 * general case of mapping from a stream of bytes or shorts into
 * arbitrary float or complex symbols.
 *
 * \sa gr::blocks::packed_to_unpacked_bb, gr::blocks::unpacked_to_packed_bb,
 * \sa gr::blocks::packed_to_unpacked_ss, gr::blocks::unpacked_to_packed_ss,
 * \sa gr::blocks::chunks_to_symbols_bf, gr::blocks::chunks_to_symbols_bc.
 * \sa gr::blocks::chunks_to_symbols_sf, gr::blocks::chunks_to_symbols_sc.
 */
template <class T>
class BLOCKS_API packed_to_unpacked : virtual public block
{
public:
    // gr::blocks::packed_to_unpacked::sptr
    typedef boost::shared_ptr<packed_to_unpacked<T>> sptr;

    static sptr make(unsigned int bits_per_chunk, endianness_t endianness);
};

typedef packed_to_unpacked<std::uint8_t> packed_to_unpacked_bb;
typedef packed_to_unpacked<std::int16_t> packed_to_unpacked_ss;
typedef packed_to_unpacked<std::int32_t> packed_to_unpacked_ii;
} /* namespace blocks */
} /* namespace gr */

#endif /* PACKED_TO_UNPACKED_H */
