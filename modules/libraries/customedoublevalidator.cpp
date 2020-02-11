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

#include "customedoublevalidator.h"

CustomeDoubleValidator::CustomeDoubleValidator(QObject *parent) :
    QDoubleValidator(parent)
{
}

CustomeDoubleValidator::CustomeDoubleValidator(double bottom, double top, int decimals, QObject *parent) :
    QDoubleValidator(bottom, top, decimals, parent)
{
}

QValidator::State CustomeDoubleValidator::validate(QString &s, int &pos) const
{
    Q_UNUSED(pos)

    if (s.isEmpty() || (s.startsWith("-") && s.length() == 1)) {
        // allow empty field or standalone minus sign
        return QValidator::Intermediate;
    }

    // check length of decimal places
    QChar point = locale().decimalPoint();

    if (s.indexOf(point) != -1) {
        int lengthDecimals = s.length() - s.indexOf(point) - 1;

        if (lengthDecimals > decimals()) {
            return QValidator::Invalid;
        }
    }

    // check range of value
    bool isNumber;
    double value = locale().toDouble(s, &isNumber);

    if (isNumber && bottom() <= value && value <= top()) {
        return QValidator::Acceptable;
    }

    return QValidator::Invalid;
}
