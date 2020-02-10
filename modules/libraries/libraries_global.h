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

#ifndef LIBRARIES_GLOBAL_H
#define LIBRARIES_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LIBRARIES_LIBRARY)
#  define LIBRARIESSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LIBRARIESSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // LIBRARIES_GLOBAL_H
