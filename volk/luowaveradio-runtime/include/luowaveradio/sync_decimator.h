/* -*- c++ -*- */
/*
 * Copyright 2004, 2013 Free Software Foundation, Inc.
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

#ifndef INCLUDED_GR_RUNTIME_SYNC_DECIMATOR_H
#define INCLUDED_GR_RUNTIME_SYNC_DECIMATOR_H

#include <luowaveradio/api.h>
#include <luowaveradio/sync_block.h>

namespace gr {

/*!
 * \brief synchronous N:1 input to output with history
 * \ingroup base_blk
 *
 * Override work to provide the signal processing implementation.
 */
class GR_RUNTIME_API sync_decimator : public sync_block
{
private:
    unsigned d_decimation;

protected:
    sync_decimator(void) {} // allows pure virtual interface sub-classes
    sync_decimator(const std::string& name,
                   gr::io_signature::sptr input_signature,
                   gr::io_signature::sptr output_signature,
                   unsigned decimation);

public:
    unsigned decimation() const { return d_decimation; }
    void set_decimation(unsigned decimation)
    {
        d_decimation = decimation;
        set_relative_rate(1, (uint64_t)decimation);
    }

    // gr::sync_decimator overrides these to assist work
    void forecast(int noutput_items, gr_vector_int& ninput_items_required);
    int general_work(int noutput_items,
                     gr_vector_int& ninput_items,
                     gr_vector_const_void_star& input_items,
                     gr_vector_void_star& output_items);

    // derived classes should override work

    int fixed_rate_ninput_to_noutput(int ninput);
    int fixed_rate_noutput_to_ninput(int noutput);
};

} /* namespace gr */

#endif /* INCLUDED_GR_RUNTIME_SYNC_DECIMATOR_H */
