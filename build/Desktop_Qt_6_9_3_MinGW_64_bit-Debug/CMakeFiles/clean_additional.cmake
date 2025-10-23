# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appfirst_start_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appfirst_start_autogen.dir\\ParseCache.txt"
  "appfirst_start_autogen"
  )
endif()
