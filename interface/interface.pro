QT += core widgets quick qml 3dcore 3drender 3dinput 3dquick 3dlogic 3dquickextras

CONFIG += c++11

win32: TARGET = ../../dist/bin/Logistics3D
unix: TARGET = Logistics3D

TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
HEADERS  += $$PWD/../version.h

SOURCES += \
             main.cpp

RESOURCES += \
             logistics3d.qrc \
             qml.qrc \
             models.qrc \
             shaders.qrc \
             textures.qrc

win32:LIBS += -L$$OUT_PWD/../dist/bin/ -llibraries
unix: LIBS += -L$$OUT_PWD/modules/libraries/ -llibraries

INCLUDEPATH += $$PWD/../modules/libraries
DEPENDPATH += $$PWD/../modules/libraries

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =
QML2_IMPORT_PATH += $PWD/theme

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
include(interface.pri)
include(translation.pri)

TRANSLATIONS =  translation/qml_vi.ts

win32:RC_FILE = interface.rc

DISTFILES += \
                android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

macos:QMAKE_INFO_PLIST = macos/Info.plist
ios:QMAKE_INFO_PLIST = ios/Info.plist

OTHER_FILES +=  images/LICENSE \
                LICENSE \
                *.md \
                interface.rc
