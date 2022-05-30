/***************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (directui@nokia.com)
**
** This file is part of applauncherd
**
** If you have questions regarding the use of this file, please contact
** Nokia at directui@nokia.com.
**
** This library is free software; you can redistribute it and/or
** modify it under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation
** and appearing in the file LICENSE.LGPL included in the packaging
** of this file.
**
****************************************************************************/

#ifndef CUTEFISH_APPMOTOR_H
#define CUTEFISH_APPMOTOR_H

#include "booster.h"

/*!
 * \class CutefishBooster.
 * \brief Qt-specific version of the Booster.
 */
class CutefishBooster : public Booster
{
public:

    //! Constructor.
    CutefishBooster() {};

    //! Destructor.
    virtual ~CutefishBooster() {};

    //! \reimp
    virtual const string & boosterType() const;

    virtual void initialize(int initialArgc, char ** initialArgv, int boosterLauncherSocket,
                            int socketFd, SingleInstance * singleInstance,
                            bool bootMode) override;

protected:

    //! \reimp
    virtual bool preload();

    virtual int launchProcess();

private:

    //! Disable copy-constructor
    CutefishBooster(const CutefishBooster & r);

    //! Disable assignment operator
    CutefishBooster & operator= (const CutefishBooster & r);

    static const string m_boosterType;
};

#endif //QTBOOSTER_H