/* -*- c++ -*- */
/*
 * Copyright 2004,2012,2018 Free Software Foundation, Inc.
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


#ifndef NOISE_SOURCE_H
#define NOISE_SOURCE_H

#include <luowaveradio/analog/api.h>
#include <luowaveradio/analog/noise_type.h>
#include <luowaveradio/sync_block.h>

namespace gr {
namespace analog {

/*!
 * \brief Random number source
 * \ingroup waveform_generators_blk
 *
 * \details
 * Generate random values from different distributions.
 * Currently, only Gaussian and uniform are enabled.
 */
template <class T>
class ANALOG_API noise_source : virtual public sync_block
{
public:
    // gr::analog::noise_source::sptr
    typedef boost::shared_ptr<noise_source<T>> sptr;

    /*! Build a noise source
     * \param type the random distribution to use (see
     *        luowaveradio/analog/noise_type.h)
     * \param ampl the standard deviation of a 1-d noise process. If
     *        this is the complex source, this parameter is split
     *        among the real and imaginary parts:
     *        <pre>(ampl/sqrt(2))x + j(ampl/sqrt(2))y</pre>
     * \param seed seed for random generators. Note that for uniform
     *        and Gaussian distributions, this should be a negative
     *        number.
     */
    static sptr make(noise_type_t type, float ampl, long seed = 0);

    /*!
     * Set the noise type. Nominally from the
     * gr::analog::noise_type_t selections, but only GR_GAUSSIAN and
     * GR_UNIFORM are currently available.
     */
    virtual void set_type(noise_type_t type) = 0;

    /*!
     * Set the standard deviation (amplitude) of the 1-d noise
     * process.
     */
    virtual void set_amplitude(float ampl) = 0;

    virtual noise_type_t type() const = 0;
    virtual float amplitude() const = 0;
};

typedef noise_source<std::int16_t> noise_source_s;
typedef noise_source<std::int32_t> noise_source_i;
typedef noise_source<float> noise_source_f;
typedef noise_source<gr_complex> noise_source_c;

} /* namespace analog */
} /* namespace gr */

#endif /* NOISE_SOURCE_H */
