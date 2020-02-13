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

TextField {
    id: control

    width: AppTheme.hscale(130)

    property string placeholder: ""

    placeholderText: enabled ? placeholder : ""

    selectByMouse: true

    background: Rectangle {
        color: enabled ? "transparent" : "#e4e4e4"

        height: AppTheme.vscale(45)

        Rectangle {
            width: parent.width
            height: AppTheme.tscale(2)
            anchors.bottom: parent.bottom
            color: "transparent"
            border.color: control.hovered ? "#000000" : control.focus ? "#0ea6f9" : "#bcbcbc"
        }
    }
}
