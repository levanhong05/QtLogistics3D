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

#include "translation.h"

#include <QApplication>

Translation::Translation(QObject *parent) :
    QObject(parent)
{
    _deTranslator = new QTranslator(this);
    _esTranslator = new QTranslator(this);
    _frTranslator = new QTranslator(this);
    _viTranslator = new QTranslator(this);
}

QString Translation::getEmptyString()
{
    return "";
}

void Translation::selectLanguage(QString language)
{
    if (language == QString("fr_FR")) { //French
         _frTranslator->load(":/logistics3d/translation/qml_fr.qm");

         qApp->installTranslator(_frTranslator);
    }

    if (language == QString("de_DE")) { //German
         _deTranslator->load(":/logistics3d/translation/qml_de.qm");

         qApp->installTranslator(_deTranslator);
    }

    if (language == QString("es_ES")) { //Spanish
         _esTranslator->load(":/logistics3d/translation/qml_es.qm");

         qApp->installTranslator(_esTranslator);
    }

    if (language == QString("vi_VN")) { //Vietnamese
        _viTranslator->load(":/logistics3d/translation/qml_vi.qm");

        qApp->installTranslator(_viTranslator);
    }

    if (language == QString("en_US")){ //English
        qApp->removeTranslator(_deTranslator);
        qApp->removeTranslator(_esTranslator);
        qApp->removeTranslator(_frTranslator);
        qApp->removeTranslator(_viTranslator);
    }

    emit languageChanged();

    emit requestTranslate(language);
}
