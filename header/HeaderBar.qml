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

import "../scripts/global.js" as Global
import "../scripts/branding.js" as Branding

Frame {
    property bool drawerVisible: true

    property bool topSpacing: true

    padding: AppTheme.tscale(10)

    Layout.fillWidth: true

    background: Rectangle {
        color: "#38addb"
        border.color: "transparent"
        radius: 0
    }

    property var navigationModel: [
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("About us"), "icon": "about.png" },
        {"type": "../header/NavigationButtonItem.qml", "name": qsTr("Help and Support"), "icon": "help.png" }
    ]

    property int headerBarIndex: -1

    onHeaderBarIndexChanged: {
        //TODO

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

                Layout.preferredWidth: AppTheme.tscale(24)
                Layout.preferredHeight: AppTheme.tscale(24)

                fillMode: Image.PreserveAspectFit
                smooth: true

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                source: "qrc:/logistics3d/images/header/menu.png"

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        navigationBar.open()
                    }
                }
            }
        }
    }

    // The sliding Drawer
    NavigationBar {
        id: navigationBar
    }
}
