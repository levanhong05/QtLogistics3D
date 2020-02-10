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
import QtQuick 2.10

Entity {
    id: environment

    SkyboxEntity {
        baseName: "qrc:/assets/skybox/skybox"
        extension: ".png"
    }

    Entity {
        components: [
            EnvironmentLight {
                irradiance: TextureLoader {
                    source: "qrc:/assets/wobbly-bridge/wobbly_bridge_4k_cube_irradiance.dds"

                    minificationFilter: Texture.LinearMipMapLinear
                    magnificationFilter: Texture.Linear
                    wrapMode {
                        x: WrapMode.ClampToEdge
                        y: WrapMode.ClampToEdge
                    }
                    generateMipMaps: false
                }

                specular: TextureLoader {
                    source: "qrc:/assets/wobbly-bridge/wobbly_bridge_4k_cube_specular.dds"

                    minificationFilter: Texture.LinearMipMapLinear
                    magnificationFilter: Texture.Linear
                    wrapMode {
                        x: WrapMode.ClampToEdge
                        y: WrapMode.ClampToEdge
                    }
                    generateMipMaps: false
                }
            }
        ]
    }
}
