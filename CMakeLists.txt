cmake_minimum_required(VERSION 3.22)

project(QTTemplate VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE C_SOURCES
  source/*.cpp source/*.c
  source/*.hpp source/*.h
)
set(QML_SOURCES
  source/Main.qml
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(${PROJECT_NAME} ${C_SOURCES})

qt_add_qml_module(${PROJECT_NAME}
  URI       ${PROJECT_NAME}
  QML_FILES ${QML_SOURCES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${PROJECT_NAME} PROPERTIES
#  MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptest
  MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
  MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
  MACOSX_BUNDLE TRUE
  WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}
  PRIVATE Qt6::Quick
)

add_definitions(${Qt6Core_DEFINITIONS})

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
