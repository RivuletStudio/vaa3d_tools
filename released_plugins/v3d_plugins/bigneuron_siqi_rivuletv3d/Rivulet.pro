
TEMPLATE	= lib
CONFIG	+= qt plugin warn_off
#CONFIG	+= x86_64

VAA3DPATH = ../../../../v3d_external
INCLUDEPATH	+= $$VAA3DPATH/v3d_main/basic_c_fun
INCLUDEPATH	+= $$VAA3DPATH/v3d_main/common_lib/include
LIBS += -L$$VAA3DPATH/v3d_main/jba/c++ -lv3dnewmat

# From V3D Main
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_memory.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/v3d_message.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_surf_objs.cpp
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/stackutil.h
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/stackutil.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_4dimage_create.cpp
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/mg_image_lib.h
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/mg_utilities.h
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/mg_image_lib.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/mg_utilities.cpp

# Main Plugin
HEADERS	+= rivulet.h
SOURCES	+= rivulet_utils.cpp
SOURCES	+= rivulet_tracer.cpp
HEADERS	+= Rivulet_plugin.h
SOURCES	+= Rivulet_plugin.cpp

# Utils
HEADERS += utils/rk4.h
SOURCES += utils/rk4.cpp
HEADERS += utils/marker_radius.h

# Fastmarching
HEADERS += fastmarching/fastmarching_dt.h
HEADERS += fastmarching/msfm.h
SOURCES += fastmarching/msfm.cpp
SOURCES += fastmarching/common.c
HEADERS += fastmarching/my_surf_objs.h
SOURCES += fastmarching/my_surf_objs.cpp

LIBS         += -lm -L$$VAA3DPATH/v3d_main/common_lib/lib -lv3dtiff
LIBS         += -lpthread
LIBS         += -lv3dfftw3f -lv3dfftw3f_threads

TARGET	= $$qtLibraryTarget(Rivulet)
DESTDIR	= $$VAA3DPATH/bin/plugins/neuron_tracing/Rivulet/
