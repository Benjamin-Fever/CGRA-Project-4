
if (NOT EXISTS "C:/Users/Benjamin Fever/CLionProjects/CGRA_Assignment_4/cmake-build-debug/ext/glfw/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: \"C:/Users/Benjamin Fever/CLionProjects/CGRA_Assignment_4/cmake-build-debug/ext/glfw/install_manifest.txt\"")
endif()

file(READ "C:/Users/Benjamin Fever/CLionProjects/CGRA_Assignment_4/cmake-build-debug/ext/glfw/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")

foreach (file ${files})
  message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  if (EXISTS "$ENV{DESTDIR}${file}")
    exec_program("C:/Users/Benjamin Fever/AppData/Local/JetBrains/Toolbox/apps/CLion/ch-0/221.5921.27/bin/cmake/win/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
                 OUTPUT_VARIABLE rm_out
                 RETURN_VALUE rm_retval)
    if (NOT "${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif()
  elseif (IS_SYMLINK "$ENV{DESTDIR}${file}")
    EXEC_PROGRAM("C:/Users/Benjamin Fever/AppData/Local/JetBrains/Toolbox/apps/CLion/ch-0/221.5921.27/bin/cmake/win/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
                 OUTPUT_VARIABLE rm_out
                 RETURN_VALUE rm_retval)
    if (NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing symlink \"$ENV{DESTDIR}${file}\"")
    endif()
  else()
    message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
  endif()
endforeach()

