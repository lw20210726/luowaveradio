/* -*- c++ -*- */
/*
 * Copyright 2005,2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_BLOCKS_COMPLEX_TO_FLOAT_H
#define INCLUDED_BLOCKS_COMPLEX_TO_FLOAT_H

#include <luowaveradio/blocks/api.h>
#include <luowaveradio/sync_block.h>

namespace gr {
namespace blocks {

/*!
 * \brief Convert a stream of gr_complex to 1 or 2 streams of float.
 * \ingroup type_converters_blk
 *
 * \details
 * If a single output stream is attached, this will output the
 * real part of the input complex samples. If a second output
 * stream is connected, output[0] is the real part and output[1]
 * is the imaginary part.
 */
class BLOCKS_API complex_to_float : virtual public sync_block
{
public:
    // gr::blocks::complex_to_float_ff::sptr
    typedef boost::shared_ptr<complex_to_float> sptr;

    /*!
     * Build a complex to float block.
     *
     * \param vlen vector len (default 1)
     */
    static sptr make(size_t vlen = 1);
};

} /* namespace blocks */
} /* namespace gr */

#endif /* INCLUDED_BLOCKS_COMPLEX_TO_FLOAT_H */
