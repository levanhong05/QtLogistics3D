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

import Setting 1.0

import "../theme"

import "../scripts/setting.js" as Settings

Dialog {
    id: root

    focus: true
    modal: true

    width: AppTheme.hscale(360)
    height:AppTheme.vscale(350)

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    property int currentLanguage: 1

    padding: AppTheme.screenPadding

    ListModel {
        id: languageModel

        ListElement {
            name: "Deutsch (Deutschland)"
            nation: "germany"
            value: "de_DE"
        }

        ListElement {
            name: "English (United States)"
            nation: "america"
            value: "en_US"
        }

        ListElement {
            name: "Español (España)"
            nation: "spain"
            value: "es_ES"
        }

        ListElement {
            name: "Français (France)"
            nation: "france"
            value: "fr_FR"
        }

        ListElement {
            name: "Tiếng Việt (Việt Nam)"
            nation: "vietnam"
            value: "vi_VN"
        }
    }

    ButtonGroup {
        id: radioGroup
    }

    ColumnLayout {
        anchors.fill: parent

        Repeater {
            model: languageModel

            focus: true

            RowLayout {
                Layout.fillWidth: true

                RadioButton {
                    text: model.name

                    font.pointSize: AppTheme.textSize13
                    Layout.fillWidth: true

                    checked: index === currentLanguage

                    padding: AppTheme.radioButtonPadding
                    spacing: AppTheme.radioButtonSpacing
                    topPadding: AppTheme.radioButtonPadding
                    bottomPadding: AppTheme.radioButtonPadding
                    leftPadding: AppTheme.radioButtonPadding
                    rightPadding: AppTheme.radioButtonPadding

                    ButtonGroup.group: radioGroup

                    onClicked: {
                        var language = model.value

                        Settings.language = language

                        currentLanguage = index

                        root.close()

                        setting.write("language", language)

                        translator.selectLanguage(language)
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Image {
                    source: "qrc:/logistics3d/images/language/" + model.nation + ".png"

                    Layout.preferredWidth: AppTheme.tscale(30)
                    Layout.preferredHeight: AppTheme.tscale(30)
                }
            }
        }
    }
}
