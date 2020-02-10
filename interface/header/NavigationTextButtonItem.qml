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

ItemDelegate {
    id: control

    property bool isActive: false //index == navigationIndex

    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus

    height: AppTheme.vscale(50)

    width: drawerBar.width

    Rectangle {
        visible: control.isActive// && highlightActiveNavigationButton
        height: control.height
        width: control.width
        color: Material.listHighlightColor
    }

    Row {
        spacing: 0
        topPadding: 0
        leftPadding: AppTheme.hscale(30)
        rightPadding: AppTheme.hscale(20)
        anchors.verticalCenter: parent.verticalCenter

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: modelData.name
            opacity: 0.87
            color: control.down ? "#5bdef0" : "#ffffff"
            font.pointSize: AppTheme.textSize12
            font.weight: Font.Light
        }
    }

    onClicked: {
        navigationIndex = index
        navigationBar.close()
    }
}
