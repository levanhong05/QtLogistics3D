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

#ifndef CUSTOMEDOUBLEVALIDATOR_H
#define CUSTOMEDOUBLEVALIDATOR_H

#include "libraries_global.h"

#include <QObject>
#include <QDoubleValidator>

class LIBRARIESSHARED_EXPORT CustomeDoubleValidator : public QDoubleValidator
{
public:
    CustomeDoubleValidator(QObject * parent = nullptr);
    CustomeDoubleValidator (double bottom, double top, int decimals, QObject * parent);

    QValidator::State validate(QString &s, int &pos) const;
};

#endif // CUSTOMEDOUBLEVALIDATOR_H
