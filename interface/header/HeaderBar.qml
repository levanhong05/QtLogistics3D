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
import QtQuick.Extras 1.4
import QtQuick.Window 2.10
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1

import "../theme"

import "../scripts/setting.js" as Settings
import "../scripts/branding.js" as Branding

Frame {
    padding: AppTheme.tscale(10)

    Layout.fillWidth: true

    background: Rectangle {
        color: "#ffffff"
        border.color: "transparent"
        radius: 0
    }

    property var navigationModel: [
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("Language") + translator.tr, "icon": "language.png" },
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("Settings") + translator.tr, "icon": "settings.png" },
        {"type": "../header/DividerItem.qml", "name": "", "icon": "" },
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("About us") + translator.tr, "icon": "about.png" },
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("Help and Support") + translator.tr, "icon": "help.png" }
    ]

    property int headerBarIndex: -1

    onHeaderBarIndexChanged: {
        switch (headerBarIndex) {
            case 0: // Language
                var strCurrentLanguage = Settings.language

                if (strCurrentLanguage === "vi_VN") {
                    languageDialog.currentLanguage = 1
                } else {
                    languageDialog.currentLanguage = 0
                }

                languageDialog.open()
                break;

            case 1: //Settings
                settingDialog.open()
                break;

            case 3: // About
                aboutDialog.open()
                break;

            case 4: //Help
                Qt.openUrlExternally("tel:" + Branding.VER_PHONE)
                break;

            case 2: //Divider
                break;

            default:
                break;
        }

        //After process, reset header index by -1
        headerBarIndex = -1
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true

            spacing: AppTheme.tscale(30)

            Image {
                id: btnMenu

                Layout.preferredWidth: AppTheme.tscale(48)
                Layout.preferredHeight: AppTheme.tscale(48)

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/images/menu_indicator.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        navigationBar.open()
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                id: lblTitle
                text: Branding.VER_APPNAME_STR
                color: "#039be6"

                font {
                    capitalization: Font.AllUppercase
                    weight: Font.Bold
                    bold: true
                    pointSize: AppTheme.textSize23
                }

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                padding: AppTheme.propertyPadding
            }

            Item {
                Layout.preferredWidth: AppTheme.hscale(50)
            }

            Image {
                id: btnSettings

                Layout.preferredWidth: AppTheme.tscale(48)
                Layout.preferredHeight: AppTheme.tscale(48)

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/images/settings.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        settingDialog.open()
                    }
                }
            }

            Item {
                Layout.preferredWidth: AppTheme.hscale(50)
            }
        }
    }

    // The sliding Drawer
    NavigationBar {
        id: navigationBar
    }
}
