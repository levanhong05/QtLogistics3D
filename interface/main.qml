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
import QtQuick.Scene3D 2.0

import Setting 1.0

import "header"
import "dialogs"
import "theme"
import "screens"

import "scripts/branding.js" as Branding

ApplicationWindow {
    id: window

    visible: true

    width: AppTheme.screenWidthSize
    height: AppTheme.screenWidthSize

    minimumWidth: AppTheme.screenWidthSize
    minimumHeight: AppTheme.screenWidthSize

    visibility: "Maximized"

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

                Scene3D {
                    id: scene3d

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    focus: true
                    aspects: ["input", "logic"]

                    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

                    RenderScreen {}
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

            padding: AppTheme.tscale(2)

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

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
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
