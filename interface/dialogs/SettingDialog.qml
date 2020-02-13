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
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.10

import "../theme"

import "../scripts/setting.js" as Settings
import "../scripts/branding.js" as Branding

Dialog {
    id: root

    focus: true
    modal: true

    width: AppTheme.hscale(900)
    height: AppTheme.vscale(500)

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    padding: AppTheme.tscale(20)

    ContactDialog {
        id: contactDialog
    }

    header: Frame {
        padding: AppTheme.vscale(10)

        background: Rectangle {
            color: "#00a8ff"
            border.color: "transparent"
            radius: 0
        }

        RowLayout {
            anchors.fill: parent

            spacing: AppTheme.hscale(30)

            Image {
                Layout.alignment: Qt.AlignLeft

                source: "qrc:/images/truck.png"

                Layout.preferredWidth: AppTheme.tscale(24)
                Layout.preferredHeight: AppTheme.tscale(24)
            }

            Label {
                text: Branding.VER_APPNAME_STR + " - " + qsTr("Settings") + translator.tr
                color: "#ffffff"
                font.bold: true
                font.pointSize: AppTheme.textSize14
                Layout.fillWidth: true

                MouseArea {
                    anchors.fill: parent

                    cursorShape: Qt.SizeAllCursor

                    property variant previousPosition

                    onPressed: {
                        previousPosition = Qt.point(mouseX, mouseY)
                    }

                    onPositionChanged: {
                        if (pressedButtons == Qt.LeftButton) {
                            var dx = mouseX - previousPosition.x
                            var dy = mouseY - previousPosition.y

                            root.x = root.x + dx
                            root.y = root.y + dy
                        }
                    }
                }
            }

            Image {
                Layout.preferredWidth: AppTheme.tscale(16)
                Layout.preferredHeight: AppTheme.tscale(16)

                Layout.alignment: Qt.AlignVCenter

                source: "qrc:/images/close.png"

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        root.close()
                    }
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent

        spacing: AppTheme.vscale(15)

        Frame {
            id: frameGeneral

            Layout.fillHeight: true
            Layout.preferredWidth: parent.width / 2

            background: Rectangle {
                color: "#ffffff"
                border.color: "#bcbcbc"
                radius: AppTheme.tscale(10)
            }

            padding: AppTheme.tscale(20)

            ColumnLayout {
                anchors.fill: parent

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        id: lblTitleTask

                        text: qsTr("General") + translator.tr
                        color: "#09a6f9"

                        font.weight: Font.Bold
                        font.bold: true
                        font.pointSize: AppTheme.textSize18

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        Layout.fillWidth: true
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: AppTheme.lineHeight
                        color: "#09a6f9"
                    }
                }

                ColumnLayout {
                    spacing: AppTheme.vscale(20)

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/customer_support.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblCustomerSupport

                            text: qsTr("Customer Support") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaCustomerSupport
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally("tel:" + Branding.VER_PHONE)
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/term-of-services.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblTermServices

                            text: qsTr("Terms of Services") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaTermServices
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally(Branding.VER_PRODUCTDOMAIN_STR)
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/privacy-policy.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblPrivacyPolicy

                            text: qsTr("Privacy Policy") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaPrivacyPolicy
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally(Branding.VER_PRODUCTDOMAIN_STR)
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/community.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblCommunity

                            text: qsTr("Community") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaCommunity
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally(Branding.VER_PRODUCTDOMAIN_STR)
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/FAQ.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblFAQ

                            text: qsTr("FAQ") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaFAQ
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally(Branding.VER_PRODUCTDOMAIN_STR)
                                }
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }
        }

        Frame {
            id: frameProduct

            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle {
                color: "#ffffff"
                border.color: "#bcbcbc"
                radius: AppTheme.tscale(10)
            }

            padding: AppTheme.tscale(20)

            ColumnLayout {
                anchors.fill: parent

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        id: lblTitleTool

                        text: qsTr("Product") + translator.tr
                        color: "#09a6f9"

                        font.weight: Font.Bold
                        font.bold: true
                        font.pointSize: AppTheme.textSize18

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        Layout.fillWidth: true
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: AppTheme.lineHeight
                        color: "#09a6f9"
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    spacing: AppTheme.vscale(20)

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/user_guide.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblUserGuide
                            text: qsTr("User Guide") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaUserGuide
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    Qt.openUrlExternally((Qt.platform.os === "windows" ? "file:///" : "file://") + applicationDir + "/guide.pdf")
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/translate.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblLanguage

                            text: qsTr("Language") + translator.tr

                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaLanguage
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    var strCurrentLanguage = Settings.language

                                    if (strCurrentLanguage === "vi_VN") {
                                        languageDialog.currentLanguage = 1
                                    } else {
                                        languageDialog.currentLanguage = 0
                                    }

                                    languageDialog.open()
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/update.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblUpdate

                            text: qsTr("Update") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaUpdate
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    //TODO
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/contact_list.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblContactList

                            text: qsTr("Contact List") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaContacList
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    contactDialog.open()
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Label {
                            id: lblVersion

                            text: qsTr("Version: %1").arg(Branding.APP_VERSION_SHORT) + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            enabled: false
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: AppTheme.screenPadding

                        Image {
                            source: "qrc:/images/settings/about.png"

                            Layout.preferredWidth: AppTheme.tscale(32)
                            Layout.preferredHeight: AppTheme.tscale(32)
                        }

                        Label {
                            id: lblAbout

                            text: qsTr("About") + translator.tr
                            font.pointSize: AppTheme.textSize14
                            Layout.fillWidth: true
                            verticalAlignment: Text.AlignVCenter

                            MouseArea {
                                id: mouseAreaAbout
                                anchors.fill: parent
                                anchors.margins: 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    aboutDialog.open()
                                }
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
