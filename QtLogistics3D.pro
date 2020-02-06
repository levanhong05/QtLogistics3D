QT += core widgets quick qml

CONFIG += c++11

win32: TARGET = ../../dist/bin/QtLogistics3D
unix: TARGET = QtLogistics3D

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
HEADERS  += version.h \
            libraries/setting.h \
            libraries/translation.h

SOURCES += \
             libraries/setting.cpp \
             libraries/translation.cpp \
             main.cpp

RESOURCES += \
             logistics3d.qrc \
             qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =
QML2_IMPORT_PATH += $PWD/theme

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
include(QtLogistics3D.pri)
include(translation.pri)

TRANSLATIONS =  translation/qml_de.ts \
                translation/qml_es.ts \
                translation/qml_fr.ts \
                translation/qml_vi.ts

win32:RC_FILE = QtLogistics3D.rc

DISTFILES += \
                android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

macos:QMAKE_INFO_PLIST = macos/Info.plist
ios:QMAKE_INFO_PLIST = ios/Info.plist

OTHER_FILES +=  images/LICENSE \
                LICENSE \
                *.md \
                QtLogistics3D.rc
