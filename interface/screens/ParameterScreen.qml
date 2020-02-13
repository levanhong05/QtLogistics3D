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

import Setting 1.0
import Validator 1.0

import "../theme"
import "../widgets"

Frame {
    id: frameGraphics

    Layout.fillWidth: true
    Layout.fillHeight: true

    padding: 0

    background: Rectangle {
        color: "transparent"
        border.color: "transparent"
        radius: 0
    }

    property var containerType: [
        { name: qsTr("Customize") + translator.tr,      length: 20,     width: 8,   height: 8.6 },
        { name: qsTr("20ft standard") + translator.tr,  length: 20,     width: 8,   height: 8.6 },
        { name: qsTr("40ft standard") + translator.tr,  length: 40,     width: 8,   height: 8.6 },
        { name: qsTr("40ft high cube") + translator.tr, length: 40,     width: 8,   height: 9.6 }
    ]

    ScrollView {
        anchors.fill: parent

        contentWidth: parent.width - AppTheme.hscale(10)

        clip: true

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            anchors.fill: parent

            columnSpacing: AppTheme.hscale(20)

            Label {
                text: qsTr("Container type") + translator.tr
                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 0
                Layout.column: 0
            }

            EComboBox {
                id: cboContainerType

                Layout.fillWidth: true

                font.pointSize: AppTheme.textSize13

                model: containerType

                sizeToContents: true

                textRole: "name"

                currentIndex: 1

                delegate: ItemDelegate {
                    width: cboContainerType.width

                    contentItem: Text {
                        text: modelData.name
                        color: "#000000"
                        font: cboContainerType.font
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    highlighted: cboContainerType.highlightedIndex === index
                }

                onCurrentIndexChanged: {
                    txtLength.text = containerType[currentIndex].length
                    txtWidth.text = containerType[currentIndex].width
                    txtHeight.text = containerType[currentIndex].height
                }

                Layout.row: 0
                Layout.column: 1
                Layout.columnSpan: 2
            }

            Label {
                id: lblLength
                text: qsTr("Container length") + translator.tr
                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 1
                Layout.column: 0
            }


            ETextField {
                id: txtLength

                Layout.fillWidth: true

                Layout.row: 1
                Layout.column: 1

                text: "20"

                enabled: cboContainerType.currentIndex == 0

                font.pointSize: AppTheme.textSize13
                placeholder: qsTr("Enter length") + translator.tr

                horizontalAlignment: Text.AlignHCenter

                validator: CustomeDoubleValidator { bottom: 0 }

                onTextChanged: {
                    //TODO
                }
            }

            Label {
                id: lblLengthUnit

                text: "ft"
                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 1
                Layout.column: 2
            }

            Label {
                text: qsTr("Container width") + translator.tr

                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 2
                Layout.column: 0
            }

            ETextField {
                id: txtWidth

                Layout.fillWidth: true

                Layout.row: 2
                Layout.column: 1

                text: "8"

                enabled: cboContainerType.currentIndex == 0

                font.pointSize: AppTheme.textSize13
                placeholder: qsTr("Enter width") + translator.tr

                horizontalAlignment: Text.AlignHCenter

                validator: CustomeDoubleValidator { bottom: 0 }

                onTextChanged: {
                    //TODO
                }
            }

            Label {
                text: "ft"

                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 2
                Layout.column: 2
            }

            Label {
                text: qsTr("Container height") + translator.tr

                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 3
                Layout.column: 0
            }

            ETextField {
                id: txtHeight

                Layout.fillWidth: true

                Layout.row: 3
                Layout.column: 1

                text: "8.6"

                enabled: cboContainerType.currentIndex == 0

                font.pointSize: AppTheme.textSize13
                placeholder: qsTr("Enter height") + translator.tr

                horizontalAlignment: Text.AlignHCenter

                validator: CustomeDoubleValidator { bottom: 0 }

                onTextChanged: {
                    //TODO
                }
            }

            Label {
                text: "ft"

                font.pointSize: AppTheme.textSize13
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom

                Layout.row: 3
                Layout.column: 2
            }
        }
    }
}
