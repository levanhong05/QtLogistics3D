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
import Qt3D.Render 2.9
import Qt3D.Input 2.0
import Qt3D.Extras 2.9
import Qt3D.Logic 2.0

import QtQuick 2.10

Entity {
    id: sceneRoot

    property vector3d rollAxis: Qt.vector3d(0, 0, 1)

    property vector3d viewOfCenter: Qt.vector3d(1.0, 1.0, 1.0)

    property int entities: 4

    property double componentWidth: 60
    property double componentHeight: 35

    property real roughness
    property real exposure
    property real gamma

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
        fieldOfView:    60

        aspectRatio:    1920 / 1080
        nearPlane:      0.01
        farPlane:       1000.0

        viewCenter:     Qt.vector3d( 0.5, 1.0, 0.1 )
        upVector:       Qt.vector3d( 0.0, 1.0, 0.0 )
        position:       Qt.vector3d( 10.0, 60.0, 0.0 )

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

    DirectionalLight {
        id: light
        worldDirection: camera.viewVector
    }

    Environment {
        id: environment
    }

    Entity {
        id: glassComponent1

        ComponentObj {
            id: glassMesh1

            z: -15

            width: componentWidth
            height: componentHeight
        }

        MetalRoughMaterial {
            id: glassMaterial1

            baseColor: Qt.rgba(255, 0, 255)
            metalness: 1
            roughness: 0
        }

        property Transform glassTransform1: Transform {
            matrix: {
                var m = Qt.matrix4x4()
                m.translate(Qt.vector3d(glassMesh1.x, glassMesh1.y, glassMesh1.z))
                m.scale(glassMesh1.scale)

                return m
            }
        }

        components: [ glassMesh1, glassMaterial1, glassTransform1 ]
    }

    Entity {
        id: glassComponent2

        ComponentObj {
            id: glassMesh2

            z: -5

            width: componentWidth
            height: componentHeight
        }

        MetalRoughMaterial {
            id: glassMaterial2

            baseColor: Qt.rgba(0, 255, 255)
            metalness: 1
            roughness: 0
        }

        property Transform glassTransform2: Transform {
            matrix: {
                var m = Qt.matrix4x4()
                m.translate(Qt.vector3d(glassMesh2.x, glassMesh2.y, glassMesh2.z))
                m.scale(glassMesh2.scale)

                return m
            }
        }

        components: [ glassMesh2, glassMaterial2, glassTransform2 ]
    }

    Entity {
        id: glassComponent3

        ComponentObj {
            id: glassMesh3

            z: 5

            width: componentWidth
            height: componentHeight
        }

        MetalRoughMaterial {
            id: glassMaterial3

            baseColor: Qt.rgba(255, 255, 0)
            metalness: 1
            roughness: 0
        }

        property Transform glassTransform3: Transform {
            matrix: {
                var m = Qt.matrix4x4()
                m.translate(Qt.vector3d(glassMesh3.x, glassMesh3.y, glassMesh3.z))
                m.scale(glassMesh3.scale)

                return m
            }
        }

        components: [ glassMesh3, glassMaterial3, glassTransform3 ]
    }

    Entity {
        id: glassComponent4

        ComponentObj {
            id: glassMesh4

            z: 15

            width: componentWidth
            height: componentHeight
        }

        MetalRoughMaterial {
            id: glassMaterial4

            baseColor: Qt.rgba(0, 0, 255)
            metalness: 1
            roughness: 0
        }

        property Transform glassTransform4: Transform {
            matrix: {
                var m = Qt.matrix4x4()
                m.translate(Qt.vector3d(glassMesh4.x, glassMesh4.y, glassMesh4.z))
                m.scale(glassMesh4.scale)

                return m
            }
        }

        components: [ glassMesh4, glassMaterial4, glassTransform4 ]
    }
}
