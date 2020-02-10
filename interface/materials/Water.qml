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

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQuick 2.0

Entity {
    id: water

    WaterMaterial {
        id: watermaterial

        property real tox: 0.0
        property real toy: 0.0
        property real vertY: 1.0
        property real waveRandomAnim: 0.0

        diffuse: "qrc:/textures/WaterDiffuse.jpg"
        normal: "qrc:/textures/WaterNormal.jpg"
        specular: "qrc:/textures/WaterSpecular.jpg"
        wave: "qrc:/textures/Waterwave.jpg"
        sky: "qrc:/textures/sky.jpg"
        foam: "qrc:/textures/foam.jpg"

        textureScale: 1.0
        wavescale: vertY * 0.75
        specularity: 1.0
        offsetx: tox * 1.1
        offsety: toy * 1.1
        normalAmount: 2.2
        waveheight: 0.2
        waveStrenght: 0.015
        shininess: 100
        waveRandom: waveRandomAnim
    }

    Mesh {
        id: watermesh
        source: "qrc:/models/waterPlane.obj"
    }

    Transform {
        id: waterTransform
        property real scale: 1.0
        property real rotx: 0.0
        scale3D: Qt.vector3d(scale, scale, scale)
        rotationY: 35.0
    }

    Entity {
        id: waterEntity
        components: [watermesh, watermaterial, waterTransform]
    }

    SequentialAnimation {
        NumberAnimation {
            target: watermaterial
            property: "waveRandomAnim"
            to: 3.0
            duration: 4000
            easing.type: Easing.Linear
        }

        NumberAnimation {
            target: watermaterial
            property: "waveRandomAnim"
            to: 1.0
            duration: 4000
            easing.type: Easing.Linear
        }
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        ParallelAnimation {
            NumberAnimation {
                target: watermaterial
                property: "toy"
                to: 10.0
                duration: 100000
            }

            NumberAnimation {
                target: watermaterial
                property: "tox"
                to: 10.0
                duration: 100000
            }
        }

        ParallelAnimation {
            NumberAnimation {
                target: watermaterial
                property: "toy"
                to: 0.0
                duration: 0
            }

            NumberAnimation {
                target: watermaterial
                property: "tox"
                to: 0.0
                duration: 0
            }
        }
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: watermaterial
            property: "vertY"
            to: 200
            duration: 200000
            easing.type: Easing.Linear
        }

        NumberAnimation {
            target: watermaterial
            property: "vertY"
            to: 2
            duration: 200000
            easing.type: Easing.Linear
        }
    }
}

