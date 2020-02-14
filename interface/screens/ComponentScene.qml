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

import Qt3D.Core 2.10
import Qt3D.Render 2.9
import Qt3D.Input 2.0
import Qt3D.Extras 2.9
import Qt3D.Logic 2.0

import QtQuick 2.10

import "../components"

import "../scripts/global.js" as Global
import "../scripts/maths.js" as Maths

Entity {
    id: sceneRoot

    property vector3d rollAxis: Qt.vector3d(0, 0, 1)

    property vector3d viewOfCenter: Qt.vector3d(1.0, 1.0, 1.0)

    property int entities: 4

    property double componentWidth: 60
    property double componentHeight: 35

    property real roughness: 0
    property real exposure: 2
    property real gamma: 2.8

    property real containerLength: Maths.ft2cm(20)
    property real containerWidth: Maths.ft2cm(8)
    property real containerHeight: Maths.ft2cm(8.6)

    MouseDevice {
        id: mouseDevice

        sensitivity: 0.5
    }

    MouseHandler {
        property point lastPoint

        property real panAngle
        property real tiltAngle
        property real rotateAngle

        onPanAngleChanged: camera.panAboutViewCenter(panAngle)
        onTiltAngleChanged: camera.tiltAboutViewCenter(tiltAngle)

        onRotateAngleChanged: camera.rollAboutViewCenter(rotateAngle)

        sourceDevice: mouseDevice

        onPressed: {
            lastPoint = Qt.point(mouse.x, mouse.y)
        }

        onPositionChanged: mouseMove(mouse)

        function mouseMove(mouse) {
            if ((mouse.buttons === Qt.LeftButton) && (mouse.modifiers & Qt.ControlModifier)) {
                rotateAngle = mouse.y - lastPoint.y
            } else if (mouse.buttons === Qt.LeftButton) {
                panAngle = -(mouse.x - lastPoint.x)
                tiltAngle = (mouse.y - lastPoint.y)
            }

            lastPoint = Qt.point(mouse.x, mouse.y)
        }
    }

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView:    100

        aspectRatio:    1920 / 1080
        nearPlane:      0.01
        farPlane:       1000.0

        viewCenter:     Qt.vector3d( 0.5, 1.0, 0.1 )
        upVector:       Qt.vector3d( 0.0, 1.0, 0.0 )
        position:       Qt.vector3d( 10.0, -100.0, 0.0 )

        exposure: sceneRoot.exposure
    }

    OrbitCameraController {
        camera: camera
        linearSpeed: 10
        lookSpeed: 240
        zoomInLimit: 200
    }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                id: renderer
                camera: camera

                clearColor: "#ffffff"
                gamma: sceneRoot.gamma
            }
        },

        InputSettings { }
    ]

    Lights { }

    Entity {
        components: [
            PointLight {
                enabled: parent.enabled
                color: "black"
                intensity: 0
            },
            EnvironmentLight {
                enabled: parent.enabled

                irradiance: TextureLoader {
                    source: "qrc:/assets/default_irradiance.dds"
                    wrapMode {
                        x: WrapMode.ClampToEdge
                        y: WrapMode.ClampToEdge
                    }
                    generateMipMaps: false
                }
                specular: TextureLoader {
                    source: "qrc:/assets/default_specular.dds"
                    wrapMode {
                        x: WrapMode.ClampToEdge
                        y: WrapMode.ClampToEdge
                    }
                    generateMipMaps: false
                }
            }
        ]
    }

    ContainerObject {
        width: containerWidth * Global.RENDER_RATIO
        height: containerHeight * Global.RENDER_RATIO
        thickness: 1

        z: containerLength * Global.RENDER_RATIO / 2 * -1

        side: ContainerObject.ContainerSide.FRONTS
    }

    ContainerObject {
        width: containerWidth * Global.RENDER_RATIO
        height: containerHeight * Global.RENDER_RATIO
        thickness: 1

        z: containerLength * Global.RENDER_RATIO / 2

        side: ContainerObject.ContainerSide.BACK_DOOR
    }

    ContainerObject {
        width: containerWidth * Global.RENDER_RATIO
        height: 1
        thickness: containerLength * Global.RENDER_RATIO

        y: containerHeight * Global.RENDER_RATIO / 2 * -1

        side: ContainerObject.ContainerSide.TOP
    }

    ContainerObject {
        width: containerWidth * Global.RENDER_RATIO
        height: 1
        thickness: containerLength * Global.RENDER_RATIO

        y: containerHeight * Global.RENDER_RATIO / 2

        side: ContainerObject.ContainerSide.BOTTOM
    }

    ContainerObject {
        width: 1
        height: containerHeight * Global.RENDER_RATIO
        thickness: containerLength * Global.RENDER_RATIO

        x: containerWidth * Global.RENDER_RATIO / 2 * -1

        side: ContainerObject.ContainerSide.SIDE_FRONT
    }

    ContainerObject {
        width: 1
        height: containerHeight * Global.RENDER_RATIO
        thickness: containerLength * Global.RENDER_RATIO

        x: containerWidth * Global.RENDER_RATIO / 2

        side: ContainerObject.ContainerSide.SIDE_BACK
    }

    NodeInstantiator {
        model: entities

        delegate: PackageObject {
            z: -15 + 10 * index

            width: componentWidth
            height: componentHeight

            materialColor: Qt.rgba(Math.random(), Math.random(), Math.random())
        }
    }
}
