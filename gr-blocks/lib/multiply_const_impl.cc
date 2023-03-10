/* -*- c++ -*- */
/*
 * Copyright 2004,2009,2010,2012,2018 Free Software Foundation, Inc.
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


#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "multiply_const_impl.h"
#include <luowaveradio/io_signature.h>
#include <volk/volk.h>

namespace gr {
namespace blocks {

template <class T>
typename multiply_const<T>::sptr multiply_const<T>::make(T k, size_t vlen)
{
    return luowaveradio::get_initial_sptr(new multiply_const_impl<T>(k, vlen));
}

template <>
multiply_const_impl<float>::multiply_const_impl(float k, size_t vlen)
    : sync_block("multiply_const_ff",
                 io_signature::make(1, 1, sizeof(float) * vlen),
                 io_signature::make(1, 1, sizeof(float) * vlen)),
      d_k(k),
      d_vlen(vlen)
{
    const int alignment_multiple = volk_get_alignment() / sizeof(float);
    set_alignment(std::max(1, alignment_multiple));
}

template <>
int multiply_const_impl<float>::work(int noutput_items,
                                     gr_vector_const_void_star& input_items,
                                     gr_vector_void_star& output_items)
{
    const float* in = (const float*)input_items[0];
    float* out = (float*)output_items[0];
    int noi = noutput_items * d_vlen;

    volk_32f_s32f_multiply_32f(out, in, d_k, noi);

    return noutput_items;
}

template <>
multiply_const_impl<gr_complex>::multiply_const_impl(gr_complex k, size_t vlen)
    : sync_block("multiply_const_cc",
                 io_signature::make(1, 1, sizeof(gr_complex) * vlen),
                 io_signature::make(1, 1, sizeof(gr_complex) * vlen)),
      d_k(k),
      d_vlen(vlen)
{
    const int alignment_multiple = volk_get_alignment() / sizeof(gr_complex);
    set_alignment(std::max(1, alignment_multiple));
}

template <>
int multiply_const_impl<gr_complex>::work(int noutput_items,
                                          gr_vector_const_void_star& input_items,
                                          gr_vector_void_star& output_items)
{
    const gr_complex* in = (const gr_complex*)input_items[0];
    gr_complex* out = (gr_complex*)output_items[0];
    int noi = noutput_items * d_vlen;

    volk_32fc_s32fc_multiply_32fc(out, in, d_k, noi);

    return noutput_items;
}


template <class T>
multiply_const_impl<T>::multiply_const_impl(T k, size_t vlen)
    : sync_block("multiply_const",
                 io_signature::make(1, 1, sizeof(T) * vlen),
                 io_signature::make(1, 1, sizeof(T) * vlen)),
      d_k(k),
      d_vlen(vlen)
{
}

template <class T>
int multiply_const_impl<T>::work(int noutput_items,
                                 gr_vector_const_void_star& input_items,
                                 gr_vector_void_star& output_items)
{
    T* iptr = (T*)input_items[0];
    T* optr = (T*)output_items[0];

    int size = noutput_items * d_vlen;

    while (size >= 8) {
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        *optr++ = *iptr++ * d_k;
        size -= 8;
    }

    while (size-- > 0)
        *optr++ = *iptr++ * d_k;

    return noutput_items;
}

template class multiply_const<std::int16_t>;
template class multiply_const<std::int32_t>;
template class multiply_const<float>;
template class multiply_const<gr_complex>;
} /* namespace blocks */
} /* namespace gr */
