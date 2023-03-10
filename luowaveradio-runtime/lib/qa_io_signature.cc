/* -*- c++ -*- */
/*
 * Copyright 2004,2013 Free Software Foundation, Inc.
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
#include <config.h>
#endif

#include <luowaveradio/io_signature.h>
#include <boost/test/unit_test.hpp>
#include <stdexcept>

BOOST_AUTO_TEST_CASE(t0) { gr::io_signature::make(1, 1, sizeof(int)); }

BOOST_AUTO_TEST_CASE(t1)
{
    BOOST_REQUIRE_THROW(gr::io_signature::make(3, 1, sizeof(int)), std::invalid_argument);
}

BOOST_AUTO_TEST_CASE(t2)
{
    gr::io_signature::sptr p =
        gr::io_signature::make(3, gr::io_signature::IO_INFINITE, sizeof(int));

    BOOST_CHECK_EQUAL(p->min_streams(), 3);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(0), (int)sizeof(int));
}

BOOST_AUTO_TEST_CASE(t3)
{
    gr::io_signature::sptr p = gr::io_signature::make3(0, 5, 1, 2, 3);

    BOOST_CHECK_EQUAL(p->min_streams(), 0);
    BOOST_CHECK_EQUAL(p->max_streams(), 5);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(0), 1);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(1), 2);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(2), 3);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(3), 3);
    BOOST_CHECK_EQUAL(p->sizeof_stream_item(4), 3);
}
