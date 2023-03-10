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

#ifndef INCLUDED_GR_VCO_C_H
#define INCLUDED_GR_VCO_C_H

#include <luowaveradio/blocks/api.h>
#include <luowaveradio/sync_block.h>

namespace gr {
namespace blocks {

/*!
 * \brief VCO - Voltage controlled oscillator
 * \ingroup modulators_blk
 * \ingroup waveform_generators_blk
 *
 * \details
 * input: float stream of control voltages; output: complex oscillator output
 */
class BLOCKS_API vco_c : virtual public sync_block
{
public:
    // gr::blocks::vco_c::sptr
    typedef boost::shared_ptr<vco_c> sptr;

    /*!
     * \brief VCO - Voltage controlled oscillator
     *
     * \param sampling_rate sampling rate (Hz)
     * \param sensitivity units are radians/sec/volt
     * \param amplitude output amplitude
     */
    static sptr make(double sampling_rate, double sensitivity, double amplitude);
};

} /* namespace blocks */
} /* namespace gr */

#endif /* INCLUDED_GR_VCO_C_H */
