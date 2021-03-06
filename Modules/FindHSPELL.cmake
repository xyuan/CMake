# - Try to find Hspell
# Once done this will define
#
#  HSPELL_FOUND - system has Hspell
#  HSPELL_INCLUDE_DIR - the Hspell include directory
#  HSPELL_LIBRARIES - The libraries needed to use Hspell
#  HSPELL_DEFINITIONS - Compiler switches required for using Hspell
#
#  HSPELL_VERSION_STRING - The version of Hspell found (x.y)
#  HSPELL_MAJOR_VERSION  - the major version of Hspell
#  HSPELL_MINOR_VERSION  - The minor version of Hspell

#=============================================================================
# Copyright 2006-2009 Kitware, Inc.
# Copyright 2006 Alexander Neundorf <neundorf@kde.org>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

FIND_PATH(HSPELL_INCLUDE_DIR hspell.h)

FIND_LIBRARY(HSPELL_LIBRARIES NAMES hspell)

IF (HSPELL_INCLUDE_DIR)
    FILE(READ "${HSPELL_INCLUDE_DIR}/hspell.h" HSPELL_H)
    STRING(REGEX REPLACE ".*#define HSPELL_VERSION_MAJOR ([0-9]+).*" "\\1" HSPELL_VERSION_MAJOR "${HSPELL_H}")
    STRING(REGEX REPLACE ".*#define HSPELL_VERSION_MINOR ([0-9]+).*" "\\1" HSPELL_VERSION_MINOR "${HSPELL_H}")
    SET(HSPELL_VERSION_STRING "${HSPELL_VERSION_MAJOR}.${HSPELL_VERSION_MINOR}")
ENDIF()

# handle the QUIETLY and REQUIRED arguments and set HSPELL_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(HSPELL
                                  REQUIRED_VARS HSPELL_LIBRARIES HSPELL_INCLUDE_DIR
                                  VERSION_VAR HSPELL_VERSION_STRING)

MARK_AS_ADVANCED(HSPELL_INCLUDE_DIR HSPELL_LIBRARIES)

