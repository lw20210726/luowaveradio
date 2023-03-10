/* -*- c++ -*- */
/*
 * Copyright 2007,2012,2016 Free Software Foundation, Inc.
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

#ifndef INCLUDED_GR_GLFSR_SOURCE_B_H
#define INCLUDED_GR_GLFSR_SOURCE_B_H

#include <luowaveradio/digital/api.h>
#include <luowaveradio/sync_block.h>

namespace gr {
namespace digital {

/*!
 * \brief Galois LFSR pseudo-random source
 * \ingroup waveform_generators_blk
 */
class DIGITAL_API glfsr_source_b : virtual public sync_block
{
public:
    // gr::digital::glfsr_source_b::sptr
    typedef boost::shared_ptr<glfsr_source_b> sptr;

    /*!
     * Make a Galois LFSR pseudo-random source block.
     *
     * \param degree Degree of shift register must be in [1, 32]. If mask
     *               is 0, the degree determines a default mask (see
     *               digital_impl_glfsr.cc for the mapping).
     * \param repeat Set to repeat sequence.
     * \param mask   Allows a user-defined bit mask for indexes of the shift
     *               register to feed back.
     * \param seed   Initial setting for values in shift register.
     */
    static sptr make(unsigned int degree,
                     bool repeat = true,
                     uint32_t mask = 0x0,
                     uint32_t seed = 0x1);

    virtual uint32_t period() const = 0;
    virtual uint32_t mask() const = 0;
};

} /* namespace digital */
} /* namespace gr */

#endif /* INCLUDED_GR_GLFSR_SOURCE_B_H */
