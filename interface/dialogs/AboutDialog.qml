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

import "../scripts/branding.js" as Branding

Dialog {
    id: root

    focus: true
    modal: true

    width: AppTheme.hscale(700)
    height: AppTheme.vscale(400)

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    padding: AppTheme.tscale(20)

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
                Layout.alignment: Text.AlignLeft

                source: "qrc:/images/truck.png"

                Layout.preferredWidth: AppTheme.tscale(24)
                Layout.preferredHeight: AppTheme.tscale(24)
            }

            Label {
                text: Branding.VER_APPNAME_STR + " - " + qsTr("About") + translator.tr
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

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        anchors.fill: parent

        spacing: AppTheme.vscale(15)

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            spacing: AppTheme.hscale(50)

            Image {
                id: imgProductIcon

                source: "qrc:/images/truck.png"

                Layout.preferredWidth: AppTheme.tscale(100)
                Layout.preferredHeight: AppTheme.tscale(100)

                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                spacing: AppTheme.vscale(15)

                Label {
                    horizontalAlignment: Text.AlignLeft

                    text: Branding.TEXTVERSIONSHORT
                    font.pointSize: AppTheme.textSize14
                    font.weight: Font.Bold

                    Layout.fillWidth: true
                }

                RowLayout {
                    Layout.fillWidth: true

                    Label {
                        text: qsTr("Developed by ") + translator.tr
                        font.pointSize: AppTheme.textSize12
                    }

                    Label {
                        id: lblManufacturer

                        text: Branding.VER_MANUFACTURER_STR
                        font.pointSize: AppTheme.textSize12
                        font.underline: true
                        color: "#04aade"

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: 0
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                Qt.openUrlExternally(Branding.VER_COMPANYDOMAIN_STR)
                            }
                        }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    Label {
                        text: qsTr("Email: ") + translator.tr
                        font.pointSize: AppTheme.textSize12
                    }

                    Label {
                        id: lblEmail
                        text: Branding.VER_EMAIL
                        font.pointSize: AppTheme.textSize12
                        font.underline: true
                        color: "#04aade"

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: 0
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                Qt.openUrlExternally("mailto:" + Branding.VER_EMAIL)
                            }
                        }
                    }
                }

                Label {
                    text: qsTr("Qt/QML and C++ Senior Developer") + translator.tr
                    font.pointSize: AppTheme.textSize12
                }
            }
        }

        Label {
            text: qsTr("Warning: This program is protected by copyright law and international treaties. Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, an will be prosecured to the maximum extent possible under the law.") + translator.tr

            font.pointSize: AppTheme.textSize12

            horizontalAlignment: Text.AlignJustify
            verticalAlignment: Text.AlignVCenter

            Layout.fillWidth: true

            wrapMode: Text.WordWrap
        }

        Item {
            Layout.preferredHeight: AppTheme.vscale(5)
        }

        Label {
            text: qsTr("Copyright © 2020 by Eric Lee. All rights reserved.") + translator.tr
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: AppTheme.textSize12

            Layout.fillWidth: true
        }
    }
}
