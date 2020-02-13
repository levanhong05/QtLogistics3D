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

ComboBox {
    id: control

    property bool sizeToContents
    property int modelWidth

    width: (sizeToContents) ? modelWidth + 2 * leftPadding + 2 * rightPadding : implicitWidth
    height: AppTheme.vscale(40)

    delegate: ItemDelegate {
        width: (sizeToContents) ? Math.max(modelWidth + 2 * leftPadding + 2 * rightPadding, control.width) : implicitWidth

        contentItem: Text {
            text: modelData
            color: "#000000"
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        highlighted: control.highlightedIndex === index
        hoverEnabled: true
    }

    contentItem: TextField {
        leftPadding: 0
        rightPadding: 0

        width: control.width

        text: control.editable ? control.editText : control.displayText
        font: control.font
        enabled: control.editable

        color: control.enabled ? "#000000" : "#696969"

        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable && !control.flat
            border.width: 0
            border.color: "transparent"
            color: "transparent"
        }
    }

    background: Rectangle {
        implicitWidth: AppTheme.comboBoxImplicitWidth
        implicitHeight: AppTheme.comboBoxImplicitHeight

        height: AppTheme.vscale(45)

        color: enabled ? "transparent" : "#e4e4e4"

        Rectangle {
            width: parent.width
            height: AppTheme.tscale(2)
            anchors.bottom: parent.bottom
            color: "transparent"
            border.color: control.hovered ? "#000000" : control.pressed ? "#23a7d2" : "#d8d8d8"
        }
    }

    popup: Popup {
        y: control.height - AppTheme.tscale(2)

        width: control.width
        implicitHeight: contentItem.implicitHeight

        padding: AppTheme.tscale(2)

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight

            model: control.popup.visible ? control.delegateModel : null

            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: "#bcbcbc"
        }
    }
}
