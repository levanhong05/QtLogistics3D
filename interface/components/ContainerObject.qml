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

Entity {
    id: entity

    enum ContainerSide {
        FRONTS,
        BACK_DOOR,
        TOP,
        BOTTOM,
        SIDE_FRONT,
        SIDE_BACK
    }

    property real x: 0
    property real y: 0
    property real z: 0

    property real width: 60
    property real height: 35
    property real thickness: 1

    property real scaleValue: 1

    property int side: ContainerObject.ContainerSide.BOTTOM

    CuboidMesh {
        id: mesh

        xExtent: width
        yExtent: height
        zExtent: thickness
    }

    TexturedMetalRoughMaterial {
        id: material

        baseColor: "silver"

        normal: TextureLoader {
            source: side === ContainerObject.ContainerSide.FRONTS ? "qrc:/textures/container_front.jpg" : side === ContainerObject.ContainerSide.BACK_DOOR ? "qrc:/textures/container_door.jpg" : "qrc:/textures/container_side.jpg";
            wrapMode {
                x: WrapMode.ClampToEdge
                y: WrapMode.ClampToEdge
            }
            generateMipMaps: true
        }

        metalness: 0.82
        roughness: 0.32
    }

    property Transform transformMatrix: Transform {
        matrix: {
            var m = Qt.matrix4x4()
            m.translate(Qt.vector3d(x, y, z))
            m.scale(scaleValue)

            return m
        }
    }

    components: [ mesh, material, transformMatrix ]
}
