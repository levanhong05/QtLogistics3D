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

import Qt3D.Render 2.0
import Qt3D.Extras 2.0

CuboidMesh {
    property real x: 0
    property real y: 0
    property real z: 0

    property real width: 60
    property real height: 35
    property real thickness: 10

    property real scale: 1

    xExtent: width
    yExtent: height
    zExtent: thickness
}
