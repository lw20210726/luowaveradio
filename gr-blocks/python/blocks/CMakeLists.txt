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

GR_PYTHON_INSTALL(
    FILES
    __init__.py
    parse_file_metadata.py
    stream_to_vector_decimator.py
    DESTINATION ${GR_PYTHON_DIR}/luowaveradio/blocks
)

########################################################################
# Handle the unit tests
########################################################################
if(ENABLE_TESTING)

  set(GR_TEST_TARGET_DEPS "")
  set(GR_TEST_LIBRARY_DIRS "")
  set(GR_TEST_PYTHON_DIRS
    ${CMAKE_BINARY_DIR}/luowaveradio-runtime/python
    ${CMAKE_BINARY_DIR}/luowaveradio-runtime/swig	
    ${CMAKE_BINARY_DIR}/gr-blocks/swig
    )

  include(GrTest)
  file(GLOB py_qa_test_files "qa_*.py")

  # Force out the controlport QA tests if CTRLPORT is not enabled or
  # if it is enabled but we have no backends to use.
  if(NOT ENABLE_GR_CTRLPORT OR CTRLPORT_BACKENDS EQUAL 0)
    list(REMOVE_ITEM py_qa_test_files
      ${CMAKE_CURRENT_SOURCE_DIR}/qa_cpp_py_binding.py
      ${CMAKE_CURRENT_SOURCE_DIR}/qa_cpp_py_binding_set.py
      ${CMAKE_CURRENT_SOURCE_DIR}/qa_ctrlport_probes.py
      )
  endif(NOT ENABLE_GR_CTRLPORT OR CTRLPORT_BACKENDS EQUAL 0)

  foreach(py_qa_test_file ${py_qa_test_files})
    get_filename_component(py_qa_test_name ${py_qa_test_file} NAME_WE)
    GR_ADD_TEST(${py_qa_test_name} ${QA_PYTHON_EXECUTABLE} -B ${py_qa_test_file})
  endforeach(py_qa_test_file)

endif(ENABLE_TESTING)
