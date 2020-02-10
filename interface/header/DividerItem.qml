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
import QtQuick.Controls 2.3

import "../theme"

Item {
    // 8 above and 8 below divider between content
    height: AppTheme.vscale(17)

    anchors.left: parent.left
    anchors.right: parent.right

    Rectangle {
        width: parent.width
        height: AppTheme.vscale(2)
        opacity: 0.2
        color: "#000000"
    }
}
