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
import QtQuick.Controls 2.3

import "../theme"

Switch {
    id: control
    text: ""

    property bool bidirect: false

    property bool textBold: false

    indicator: Rectangle {
        implicitWidth: AppTheme.switchImplicitWidth
        implicitHeight: AppTheme.switchImplicitHeight

        x: control.leftPadding
        y: parent.height / 2 - height / 2

        radius: AppTheme.switchRadius
        color: bidirect ? "#0ea6f9" : control.checked ? "#0ea6f9" : enabled ? "#ffffff" : "#e4e4e4"
        border.color: bidirect ? "#0ea6f9" : control.checked ? "#0ea6f9" : "#bcbcbc"

        Label {
            visible: !bidirect

            font.pointSize: AppTheme.textSize10
            font.bold: true

            x: control.checked ? AppTheme.hscale(7) : parent.width - width - AppTheme.hscale(5)

            text: control.checked ? "ON" : "OFF"

            color: control.checked ? "#ffffff" : "#9c9c9c"

            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: indicatorRec

            x: control.checked ? parent.width - width - AppTheme.hscale(2) : AppTheme.hscale(2)

            width: AppTheme.switchSize
            height: AppTheme.switchSize
            radius: AppTheme.switchRadius

            color: control.checked ? "#ffffff" : enabled ? "#ffffff" : "#e4e4e4"
            border.color: "#bcbcbc"

            anchors.verticalCenter: parent.verticalCenter
        }
    }

    contentItem: Text {
        text: control.text

        font.pointSize: AppTheme.textSize13
        font.weight: Font.Light

        font.bold: textBold

        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? "#0ea6f9" : "#000000"

        wrapMode: Text.WordWrap 

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        leftPadding: control.indicator.width + control.spacing

        visible: control.text !== ""
    }
}
