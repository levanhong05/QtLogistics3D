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
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2

import "../theme"

import "../scripts/branding.js" as Branding

Drawer {
    id: drawerBar

    property alias navigationButtons: navigationButtonRepeater
    property real activeOpacity: 0.87
    property real inactiveOpacity: 0.56

    property bool logoEnabed: true

    property bool highlightActiveNavigationButton : false

    width: Math.min(window.width, window.height) / 2

    height: window.height

    padding: 0

    opacity: 0.95

    background: Rectangle {
        color: "#0d384e"
    }

    Flickable {
        anchors.fill: parent

        clip: true
        interactive: false

        Column {
            id: myButtons
            focus: false

            anchors.left: parent.left
            anchors.right: parent.right

            anchors.fill: parent
            anchors.topMargin: AppTheme.hscale(20)

            spacing: AppTheme.tscale(15)

            Row {
                anchors.left: parent.left
                anchors.right: parent.right

                spacing: AppTheme.tscale(15)

                RoundButton {
                    id: btnLogo

                    width: AppTheme.tscale(64)
                    height: AppTheme.tscale(64)

                    contentItem: Image {
                        id: image

                        fillMode: Image.PreserveAspectFit

                        horizontalAlignment: Image.AlignHCenter
                        verticalAlignment: Image.AlignVCenter

                        source: "qrc:/images/truck.png"
                    }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        visible: logoEnabed

                        onClicked: {
                            navigationBar.close()
                        }
                    }
                }

                Label {
                    id: lblUsername

                    text: "Eric Lee"
                    color: "#ffffff"

                    font.pointSize: AppTheme.textSize14
                    font.bold: true

                    verticalAlignment: Text.AlignVCenter

                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                color: "silver"

                width: drawerBar.width / 10 * 8
                height: AppTheme.vscale(2)

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Repeater {
                id: navigationButtonRepeater

                model: navigationModel

                Loader {
                    Layout.fillWidth: true
                    source: modelData.type
                    active: true
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
