# Copyright 2012 Free Software Foundation, Inc.
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

########################################################################
include(GrPython)

install(
    FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/icon.png
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/ctrlport
)


GR_PYTHON_INSTALL(
    FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/__init__.py
    ${CMAKE_CURRENT_SOURCE_DIR}/GrDataPlotter.py
    ${CMAKE_CURRENT_SOURCE_DIR}/monitor.py
    ${CMAKE_CURRENT_SOURCE_DIR}/luowaveradioControlPortClient.py
    ${CMAKE_CURRENT_SOURCE_DIR}/RPCConnection.py
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/ctrlport/
)

GR_PYTHON_INSTALL(
    PROGRAMS
    ${CMAKE_CURRENT_SOURCE_DIR}/gr-perf-monitorx
    ${CMAKE_CURRENT_SOURCE_DIR}/gr-ctrlport-monitor
    DESTINATION ${GR_RUNTIME_DIR}
    PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
)

if(THRIFT_FOUND)

  list(APPEND thrift_targets
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/__init__.py
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/constants.py
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/ControlPort.py
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/ControlPort-remote
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/StreamReceiver.py
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/StreamReceiver-remote
    ${CMAKE_CURRENT_BINARY_DIR}/luowaveradio/ttypes.py
  )

  add_custom_command(
    DEPENDS ${CMAKE_SOURCE_DIR}/luowaveradio-runtime/lib/controlport/thrift/luowaveradio.thrift
    OUTPUT ${thrift_targets}
    COMMAND ${THRIFT_BIN} --gen py -out ${CMAKE_CURRENT_BINARY_DIR}/ ${CMAKE_SOURCE_DIR}/luowaveradio-runtime/lib/controlport/thrift/luowaveradio.thrift
  )

  GR_PYTHON_INSTALL(
    FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/RPCConnectionThrift.py
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/ctrlport/
  )

  GR_PYTHON_INSTALL(
    FILES
    ${thrift_targets}
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/ctrlport/luowaveradio
  )

endif(THRIFT_FOUND)
