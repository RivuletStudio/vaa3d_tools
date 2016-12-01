
TEMPLATE = lib
CONFIG	 += qt plugin warn_off

QMAKE_CC = gcc-4.8
QMAKE_CXX = g++-4.8

mac{
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9
    ITKLIBPATH = ../bigneuron_zz_snake_tracing/ITKlibs_MAC
}
else{
    ITKLIBPATH = /home/siqi/v3dsrc/vaa3d_tools/released_plugins/v3d_plugins/bigneuron_zz_snake_tracing/ITKlibs_Linux
    SOURCES = ../bigneuron_zz_snake_tracing/ITK_include/itkLightProcessObject.cxx
}

VAA3DPATH = ../../../../v3d_external
INCLUDEPATH += $$VAA3DPATH/v3d_main/basic_c_fun
INCLUDEPATH += $$VAA3DPATH/v3d_main/common_lib/include

# ITK Include
ITK_INCLUDE = ../bigneuron_zz_snake_tracing/ITK_include
INCLUDEPATH += $$ITK_INCLUDE

# Link Vaa3d
LIBS += -lm -L$$VAA3DPATH/v3d_main/common_lib/lib -lv3dtiff

# Link ITK
LIBS += -L$$ITKLIBPATH -lITKCommon-4.5 -litksys-4.5 -lITKStatistics-4.5 -lITKIOImageBase-4.5 -litkdouble-conversion-4.5 
LIBS += -lvnl_algo -lvnl -lv3p_netlib

# Add ITK vnl source
SOURCES += $$ITK_INCLUDE/vcl_deprecated.cxx


# From V3D Main
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_memory.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/v3d_message.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_surf_objs.cpp
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/stackutil.h
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/stackutil.cpp
#SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/basic_4dimage_create.cpp
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/mg_image_lib.h
HEADERS += $$VAA3DPATH/v3d_main/basic_c_fun/mg_utilities.h
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/mg_image_lib.cpp
SOURCES += $$VAA3DPATH/v3d_main/basic_c_fun/mg_utilities.cpp

# Main Plugin
HEADERS += rivulet.h
SOURCES += rivulet_utils.cpp
SOURCES += rivulet_tracer.cpp
HEADERS += Rivulet_plugin.h
SOURCES += Rivulet_plugin.cpp

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

TARGET	= $$qtLibraryTarget(Rivulet)
DESTDIR	= $$VAA3DPATH/bin/plugins/neuron_tracing/Rivulet/
