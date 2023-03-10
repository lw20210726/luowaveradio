/* -*- c++ -*- */
/*
 * Copyright 2004,2012 Free Software Foundation, Inc.
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

#ifndef INCLUDED_ANALOG_FREQUENCY_MODULATOR_FC_IMPL_H
#define INCLUDED_ANALOG_FREQUENCY_MODULATOR_FC_IMPL_H

#include <luowaveradio/analog/frequency_modulator_fc.h>

namespace gr {
namespace analog {

class frequency_modulator_fc_impl : public frequency_modulator_fc
{
private:
    float d_sensitivity;
    float d_phase;

public:
    frequency_modulator_fc_impl(float sensitivity);
    ~frequency_modulator_fc_impl();

    void set_sensitivity(float sens) { d_sensitivity = sens; }
    float sensitivity() const { return d_sensitivity; }

    void setup_rpc();

    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace analog */
} /* namespace gr */

#endif /* INCLUDED_ANALOG_FREQUENCY_MODULATOR_FC_IMPL_H */
