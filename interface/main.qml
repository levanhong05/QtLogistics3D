/****************************************************************************
**
** Copyright (C) 2020 Eric Lee.
** Contact: levanhong05@gmail.com
** Company: Freelancer
**
** This file is part of the Qt Logistics 3D project.
**
**All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1

import Setting 1.0
import Validator 1.0

import "theme"
import "header"
import "dialogs"
import "widgets"
import "screens"

import "scripts/setting.js" as Settings
import "scripts/branding.js" as Branding

ApplicationWindow {
    id: window

    visible: true

    width: AppTheme.screenWidthSize
    height: AppTheme.screenWidthSize

    minimumWidth: AppTheme.screenWidthSize
    minimumHeight: AppTheme.screenWidthSize

    visibility: "Maximized"

    Material.accent: "#039be6"

    background: Rectangle {
        anchors.fill: parent

        border.color: "transparent"

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#ffffff"
            }

            GradientStop {
                position: 0.4
                color: "#ffffff"
            }

            GradientStop {
                position: 0.401
                color: "#039be6"
            }

            GradientStop {
                position: 1.0
                color: "#039be6"
            }
        }
    }

    title: Branding.VER_APPNAME_STR

    Setting {
        id: setting
    }

    AboutDialog {
        id: aboutDialog
    }

    LanguageDialog {
        id: languageDialog
    }

    SettingDialog {
        id: settingDialog
    }

    Component.onCompleted: {
        var language = setting.read("language")

        if (language === "") {
            setting.write("language", "en_US")

            Settings.language = "en_US"
        } else {
            Settings.language = language

            translator.selectLanguage(language)
        }

        var version = setting.read("version")

        var major = isNaN(Number(version.split(".")[0])) ? 0 : Number(version.split(".")[0])
        var minor = isNaN(Number(version.split(".")[1])) ? 0 : Number(version.split(".")[1])
        var revis = isNaN(Number(version.split(".")[2])) ? 0 : Number(version.split(".")[3])
        var build = isNaN(Number(version.split(".")[3])) ? 0 : Number(version.split(".")[3])

        if (version === "" || (major < Branding.VERSIONMAJOR && minor < Branding.VERSIONMINOR && revis < Branding.VERSIONREVIS && build < Branding.BUILD_NUMBER)) {
            setting.write("version", Branding.VERSIONFULL2)
        } else {
            Branding.VERSIONMAJOR = major
            Branding.VERSIONMINOR = minor
            Branding.VERSIONREVIS = revis
            Branding.BUILD_NUMBER = build
        }

        showMaximized()
    }

    header: HeaderBar {
        id: headerBarMenu
    }

    RowLayout {
        anchors.fill: parent

        spacing: 0

        Frame {
            id: frameRender

            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle {
                color: "#ffffff"
                border.color: "#bcbcbc"
            }

            ColumnLayout {
                Layout.fillWidth: true
                anchors.fill: parent

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        Label {
                            id: lblTitleRender

                            text: qsTr("Visualization Render") + translator.tr

                            font.pointSize: AppTheme.textSize14
                            font.weight: Font.Bold

                            color: "#09a6f9"

                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: AppTheme.vscale(2)
                        color: "#09a6f9"
                    }
                }

                RenderScreen {
                    id: componentUI

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Frame {
            id: frameSetting

            Layout.fillHeight: true

            Layout.preferredWidth: parent.width / 4

            background: Rectangle {
                color: "#ffffff"
                border.color: "#bcbcbc"
            }

            spacing: AppTheme.screenPadding
            padding: AppTheme.screenPadding

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                anchors.fill: parent

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        Label {
                            id: lblTitleSettings

                            text: qsTr("Parameters") + translator.tr

                            font.pointSize: AppTheme.textSize14
                            font.weight: Font.Bold

                            color: "#09a6f9"

                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: AppTheme.vscale(2)
                        color: "#09a6f9"
                    }
                }

                ParameterScreen {
                    id: parameterScreen
                }
            }
        }
    }

    footer: Label {
        text: qsTr("Copyright © 2020 by Eric Lee. All rights reserved.") + translator.tr
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: AppTheme.textSize12

        padding: AppTheme.tscale(20)

        Layout.fillWidth: true
    }
}
