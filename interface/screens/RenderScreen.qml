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
import QtQuick.Window 2.10
import QtQuick.Scene3D 2.0
import QtQuick.Layouts 1.3

import "../theme"
import "../dialogs"

Item {
    id: mainview

    visible: true

    property int entityNumbers: 4

    Scene3D {
        id: scene3d
        anchors.fill: parent
        focus: true
        aspects: ["render", "logic", "input"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

        ComponentScene {
            id: componentScene

            entities: entityNumbers

            roughness: 0
            exposure: 2
            gamma: 2.8
        }
    }

    onEntityNumbersChanged: {
        componentScene.entities = entityNumbers
    }
}
