/* -*- c++ -*- */
/*
 * Copyright 2004,2007,2012-2013 Free Software Foundation, Inc.
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

#ifndef INCLUDED_MMSE_RESAMPLER_CC_IMPL_H
#define INCLUDED_MMSE_RESAMPLER_CC_IMPL_H

#include <luowaveradio/filter/mmse_fir_interpolator_cc.h>
#include <luowaveradio/filter/mmse_resampler_cc.h>

namespace gr {
namespace filter {

class FILTER_API mmse_resampler_cc_impl : public mmse_resampler_cc
{
private:
    double d_mu;
    double d_mu_inc;
    mmse_fir_interpolator_cc* d_resamp;

public:
    mmse_resampler_cc_impl(float phase_shift, float resamp_ratio);
    ~mmse_resampler_cc_impl();

    void handle_msg(pmt::pmt_t msg);

    void forecast(int noutput_items, gr_vector_int& ninput_items_required);
    int general_work(int noutput_items,
                     gr_vector_int& ninput_items,
                     gr_vector_const_void_star& input_items,
                     gr_vector_void_star& output_items);

    float mu() const;
    float resamp_ratio() const;
    void set_mu(float mu);
    void set_resamp_ratio(float resamp_ratio);
};

} /* namespace filter */
} /* namespace gr */

#endif /* INCLUDED_MMSE_RESAMPLER_CC_IMPL_H */
