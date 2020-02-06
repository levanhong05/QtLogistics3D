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

import "header"
import "theme"

import "scripts/branding.js" as Branding

ApplicationWindow {
    id: window

    visible: true

    width: AppTheme.hscale(1080)
    height: AppTheme.vscale(640)

    title: Branding.VER_APPNAME_STR

    header: HeaderBar {
        id: headerBarMenu
    }
}
