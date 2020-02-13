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
import QtGraphicalEffects 1.0

import "../theme"

RadioButton {
    id: control

    text: ""
    property EGroupButton groupButton

    padding: AppTheme.radioButtonPadding
    spacing: AppTheme.radioButtonSpacing
    topPadding: AppTheme.radioButtonPadding
    bottomPadding: AppTheme.radioButtonPadding
    leftPadding: AppTheme.radioButtonPadding
    rightPadding: AppTheme.radioButtonPadding

    indicator: Rectangle {
        implicitWidth: AppTheme.radioButtonImplicitWidth
        implicitHeight: AppTheme.radioButtonImplicitHeight

        x: control.leftPadding
        y: parent.height / 2 - height / 2

        radius: AppTheme.radioButtonRadius

        color: control.checked ? "#0ea6f9" : enabled ? "#ffffff" : "#e4e4e4"
        border.color: "#bcbcbc"

        Image {
            id: imgIndicator

            width: AppTheme.tscale(10)
            height: AppTheme.tscale(10)

            x: control.checked ? AppTheme.hscale(10) : parent.width - indicatorRec.width

            source: control.checked ? "qrc:/vitrages/images/widget/positive.png" : "qrc:/vitrages/images/widget/negative.png"

            fillMode: Image.PreserveAspectFit

            anchors.verticalCenter: parent.verticalCenter
        }

        ColorOverlay {
            id: colorOverlay
            anchors.fill: imgIndicator
            source: imgIndicator
            color: control.checked ? "#ffffff" : "#424242"
        }

        Rectangle {
            id: indicatorRec

            x: control.checked ? parent.width - width - AppTheme.hscale(2) : AppTheme.hscale(2)

            width: AppTheme.radioButtonSize
            height: AppTheme.radioButtonSize
            radius: AppTheme.radioButtonSize / 2

            color: enabled ? "#ffffff" : "#e4e4e4"
            border.color: "#bcbcbc"

            anchors.verticalCenter: parent.verticalCenter
        }
    }

    contentItem: Text {
        text: control.text

        font.pointSize: AppTheme.textSize13

        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? "#0ea6f9" : "#000000"

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

        leftPadding: control.indicator.width + control.spacing

        visible: control.text !== ""
    }
}
