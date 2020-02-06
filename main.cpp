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

#include <QDir>
#include <QUrl>
#include <QLockFile>
#include <QDirIterator>
#include <QFontDatabase>

#include <QScreen>

#include <QMessageBox>
#include <QDesktopWidget>
#include <QStandardPaths>
#include <QGuiApplication>

#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "libraries/setting.h"
#include "libraries/translation.h"

#include "version.h"

void registerType()
{
    qmlRegisterType<Setting, 1>("Setting", 1, 0, "Setting");
}

int main(int argc, char *argv[])
{
    qputenv("QT_AUTO_SCREEN_SCALE_FACTOR", "1");
    qputenv("QT_SCALE_FACTOR", "1");

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //Reset locale
    QLocale::setDefault(QLocale(QLocale::English, QLocale::UnitedStates));

    QGuiApplication app(argc, argv);

    app.setOrganizationName(VER_COMPANYNAME_STR);
    app.setOrganizationDomain(VER_COMPANYDOMAIN_STR);
    app.setApplicationName(VER_PRODUCTNAME_STR);
    app.setApplicationVersion(VER_PRODUCTVERSION_STR);

    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneue.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuebold.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuebolditalic.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuecondensedblack.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneueitalic.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuelight.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuelightitalic.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneuemedium.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneueultralight.ttf");
    QFontDatabase::addApplicationFont(":/logistics3d/fonts/helveticaneueultralightitalic.ttf");

    QFont font;
    font.setFamily(FONT_FAMILY_STR);
    font.setWeight(38);
    font.setPointSize(10);

    QGuiApplication::setFont(font);

    bool singular = false;

    QString tmpDir = QDir::tempPath();

    QLockFile lockFile(tmpDir + "/logistic-single-lockfile");

    if (!lockFile.tryLock(100)) {
        singular = true;
    }

    if (singular) {
        QMessageBox::critical(NULL, QString(VER_PRODUCTNAME_STR),
                              QObject::tr("Application already running.\nOnly one instance is allowed."),
                              QMessageBox::Ok);

#ifdef Q_OS_WIN
        exit(1);
#else
        quick_exit(1);
#endif
        qApp->exit(1);
        QGuiApplication::exit(1);

        return 0;
    }

    Translation translator;

    registerType();

    QScreen *screen = QGuiApplication::screens().at(0);

    qreal dpi;
    qreal pdpi;

#if defined (Q_OS_WIN)
    dpi = screen->logicalDotsPerInch() * app.devicePixelRatio();
    pdpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
#elif defined(Q_OS_ANDROID)
    dpi = 96;
    pdpi = 96;
#else
    dpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
    pdpi = screen->physicalDotsPerInch() * app.devicePixelRatio();
#endif

    QString applicationLocalPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

    QString applicationDirPath = QGuiApplication::applicationDirPath();

    //Get Desktop Screen Size
    QRect rect = QGuiApplication::primaryScreen()->geometry();

    QDir dir(applicationLocalPath);

    if (!dir.exists()) {
        dir.mkpath(applicationLocalPath);
    }

    if (!dir.exists("Profiles")) {
        dir.mkdir("Profiles");
    }

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();

    context->setContextProperty("screenDpi", dpi);
    context->setContextProperty("physicalDPI", pdpi);
    context->setContextProperty("screenPixelWidth", rect.width());
    context->setContextProperty("screenPixelHeight", rect.height());

    context->setContextProperty("applicationDir", applicationDirPath);
    context->setContextProperty("localDataPath", applicationLocalPath);

    context->setContextProperty("translator", (QObject*)&translator);

    engine.addImportPath("qrc:/");

    engine.setOfflineStoragePath(applicationLocalPath);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
