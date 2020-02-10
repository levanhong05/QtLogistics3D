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

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import "../materials"

Entity {
    id: sceneRoot

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane: 0.1
        farPlane: 1000.0
        position: Qt.vector3d(0.0, 4.0, 15.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
        viewCenter: Qt.vector3d(0.0, -2.0, 0.0)
    }

    OrbitCameraController {
        camera: camera
    }

    Entity {
        DirectionalLight {
            id: directional
            worldDirection: Qt.vector3d(0.3, -1.0, 5.0).normalized();
            color: "#fff2a3"
            intensity: 0.01
        }

        Transform {
            id: lightpostransform
            translation: Qt.vector3d(0.0, 50.0, 60.0)
        }

        components: [lightpostransform, directional]
    }

    Entity {
        PointLight {
            id: pointL
            color: "#fff2a3"
        }

        Transform{
            id: plightpostransform
            translation: Qt.vector3d(0.0, 4.0, 15.0)
        }

        components: [plightpostransform, pointL]
    }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                id: renderer
                clearColor: "black"
                camera: camera
            }
        },

        InputSettings { }
    ]

    Water { }
}
