# Copyright 2011,2016 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

include(GrPython)

########################################################################
# Install some uhd apps
########################################################################
GR_PYTHON_INSTALL(
    FILES
    uhd_siggen_base.py
    uhd_app.py
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/uhd
)

GR_PYTHON_INSTALL(
    PROGRAMS
    uhd_fft
    uhd_rx_cfile
    uhd_siggen
    uhd_siggen_gui
    uhd_rx_nogui
    DESTINATION ${GR_RUNTIME_DIR}
)
