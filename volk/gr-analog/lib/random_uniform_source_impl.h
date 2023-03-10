/* -*- c++ -*- */
/*
 * Copyright 2015 Free Software Foundation, Inc.
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


#ifndef RANDOM_UNIFORM_SOURCE_IMPL_H
#define RANDOM_UNIFORM_SOURCE_IMPL_H

#include <luowaveradio/analog/random_uniform_source.h>
#include <luowaveradio/random.h>

namespace gr {
namespace analog {

template <class T>
class random_uniform_source_impl : public random_uniform_source<T>
{
private:
    gr::random* d_rng;

public:
    random_uniform_source_impl(int minimum, int maximum, int seed);
    ~random_uniform_source_impl();

    // Where all the action really happens
    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);

    int random_value();
};

} // namespace analog
} /* namespace gr */

#endif /* RANDOM_UNIFORM_SOURCE_IMPL_H */
