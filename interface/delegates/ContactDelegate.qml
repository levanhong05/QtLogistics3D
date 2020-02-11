/****************************************************************************
**
** Copyright (C) 2017 Eric Lee.
** Contact: levanhong05@gmail.com
** Company: DFM-Engineering Vietnam
**
** This file is part of the Vitrages Decision 6.0 project.
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

import "../theme"

ItemDelegate {
    id: delegate

    checkable: true

    contentItem: ColumnLayout {
        Label {
            text: name
            font.pointSize: AppTheme.textSize14
            font.bold: true
            elide: Text.ElideRight
            Layout.fillWidth: true
        }

        GridLayout {
            id: grid
            visible: false

            columns: 3
            rowSpacing: AppTheme.tscale(10)
            columnSpacing: AppTheme.tscale(10)

            Text {
                text: qsTr("Email: ") + translator.tr
                font.pointSize: AppTheme.textSize13
                Layout.leftMargin: AppTheme.hscale(60)
            }

            Text {
                text: "<a href=\"mailto:" + email + "\">" + email + "</a>"
                font.pointSize: AppTheme.textSize14
                elide: Text.ElideRight

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("mailto:" + email)
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                text: qsTr("Tel: ") + translator.tr
                font.pointSize: AppTheme.textSize13
                Layout.leftMargin: AppTheme.hscale(60)
            }

            Text {
                text: "<a href=\"tel:" + tel + "\">" + tel + "</a>"
                font.pointSize: AppTheme.textSize14
                elide: Text.ElideRight

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: 0
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Qt.openUrlExternally("tel:" + tel)
                    }
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    states: [
        State {
            name: "expanded"
            when: delegate.checked

            PropertyChanges {
                target: grid
                visible: true
            }
        }
    ]
}
