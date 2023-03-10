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

#ifndef ENCODER_IMPL_H
#define ENCODER_IMPL_H

#include <luowaveradio/trellis/encoder.h>

namespace gr {
namespace trellis {

template <class IN_T, class OUT_T>
class encoder_impl : public encoder<IN_T, OUT_T>
{
private:
    fsm d_FSM;
    int d_ST;
    int d_K;
    bool d_B;


public:
    encoder_impl(const fsm& FSM, int ST, int K, bool B);
    ~encoder_impl();

    fsm FSM() const
    {
        return d_FSM;
        ;
    }
    int ST() const { return d_ST; }
    int K() const { return d_K; }
    void set_FSM(const fsm& FSM);
    void set_ST(int ST);
    void set_K(int K);
    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} /* namespace trellis */
} /* namespace gr */

#endif /* ENCODER_IMPL_H */
