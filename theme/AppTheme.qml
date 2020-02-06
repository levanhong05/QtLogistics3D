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

pragma Singleton

import QtQml 2.2
import QtQuick 2.10

QtObject
{
    id: root

    readonly property real refScreenWidth: 1920
    readonly property real refScreenHeight: 1080

    readonly property real contentScaleFactor: screenDpi / 96;

    function dp(value) {
        return Math.round(value * contentScaleFactor)
    }

    function hscale(size) {
        return dp(Math.round(size * (screenPixelWidth / refScreenWidth)))
    }

    function vscale(size) {
        return dp(Math.round(size * (screenPixelHeight / refScreenHeight)))
    }

    function tscale(size) {
        return dp(Math.round((hscale(size) + vscale(size)) / 2))
    }

    readonly property real screenWidthSize: dp(screenPixelWidth)
    readonly property real screenHeightSize: dp(screenPixelHeight)

    readonly property real screenPadding: tscale(12)
    readonly property real propertyPadding: tscale(9)

    readonly property int textSize33: tscale(33)
    readonly property int textSize23: tscale(23)
    readonly property int textSize20: tscale(20)
    readonly property int textSize18: tscale(18)
    readonly property int textSize17: tscale(17)
    readonly property int textSize16: tscale(16)
    readonly property int textSize15: tscale(15)
    readonly property int textSize14: tscale(14)
    readonly property int textSize13: tscale(13)
    readonly property int textSize12: tscale(12)
    readonly property int textSize11: tscale(11)
    readonly property int textSize10: tscale(10)

    readonly property real rowSpacing: vscale(16)
    readonly property real columnSpacing: hscale(20)
}
