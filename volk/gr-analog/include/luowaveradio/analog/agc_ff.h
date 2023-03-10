/* -*- c++ -*- */
/*
 * Copyright 2005,2006,2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_ANALOG_AGC_FF_H
#define INCLUDED_ANALOG_AGC_FF_H

#include <luowaveradio/analog/agc.h>
#include <luowaveradio/analog/api.h>
#include <luowaveradio/sync_block.h>

namespace gr {
namespace analog {

/*!
 * \brief high performance Automatic Gain Control class
 * \ingroup level_controllers_blk
 *
 * \details
 * Power is approximated by absolute value
 */
class ANALOG_API agc_ff : virtual public sync_block
{
public:
    // gr::analog::agc_ff::sptr
    typedef boost::shared_ptr<agc_ff> sptr;

    /*!
     * Build a floating point AGC loop block.
     *
     * \param rate the update rate of the loop.
     * \param reference reference value to adjust signal power to.
     * \param gain initial gain value.
     */
    static sptr make(float rate = 1e-4, float reference = 1.0, float gain = 1.0);

    virtual float rate() const = 0;
    virtual float reference() const = 0;
    virtual float gain() const = 0;
    virtual float max_gain() const = 0;

    virtual void set_rate(float rate) = 0;
    virtual void set_reference(float reference) = 0;
    virtual void set_gain(float gain) = 0;
    virtual void set_max_gain(float max_gain) = 0;
};

} /* namespace analog */
} /* namespace gr */

#endif /* INCLUDED_ANALOG_AGC_FF_H */
