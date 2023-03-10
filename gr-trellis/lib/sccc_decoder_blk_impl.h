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


#ifndef SCCC_DECODER_BLK_IMPL_H
#define SCCC_DECODER_BLK_IMPL_H

#include <luowaveradio/trellis/sccc_decoder_blk.h>

namespace gr {
namespace trellis {

template <class T>
class sccc_decoder_blk_impl : public sccc_decoder_blk<T>
{
private:
    fsm d_FSMo;
    int d_STo0;
    int d_SToK;
    fsm d_FSMi;
    int d_STi0;
    int d_STiK;
    interleaver d_INTERLEAVER;
    int d_blocklength;
    int d_repetitions;
    siso_type_t d_SISO_TYPE;
    std::vector<float> d_buffer;

public:
    sccc_decoder_blk_impl(const fsm& FSMo,
                          int STo0,
                          int SToK,
                          const fsm& FSMi,
                          int STi0,
                          int STiK,
                          const interleaver& INTERLEAVER,
                          int blocklength,
                          int repetitions,
                          siso_type_t SISO_TYPE);
    ~sccc_decoder_blk_impl();

    fsm FSMo() const { return d_FSMo; }
    fsm FSMi() const { return d_FSMi; }
    int STo0() const { return d_STo0; }
    int SToK() const { return d_SToK; }
    int STi0() const { return d_STi0; }
    int STiK() const { return d_STiK; }
    interleaver INTERLEAVER() const { return d_INTERLEAVER; }
    int blocklength() const { return d_blocklength; }
    int repetitions() const { return d_repetitions; }
    siso_type_t SISO_TYPE() const { return d_SISO_TYPE; }

    void forecast(int noutput_items, gr_vector_int& ninput_items_required);

    int general_work(int noutput_items,
                     gr_vector_int& ninput_items,
                     gr_vector_const_void_star& input_items,
                     gr_vector_void_star& output_items);
};

} /* namespace trellis */
} /* namespace gr */

#endif /* SCCC_DECODER_BLK_IMPL_H */
