#include "dbmanager.h"
#include <QDebug>
#include "QtSql/QSqlDatabase"
#include "QSqlQuery"
#include <QFile>
#include <QStandardPaths>

DBManager::DBManager(QObject *parent) : QObject(parent)
{
    db = QSqlDatabase::addDatabase("QSQLITE");

    QString databasePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    databasePath.append("/database.db");
    QFile f(databasePath);

    if(f.exists())
    {
        QFile file(":/database.db") ;
        if (file.exists()) {
            f.remove();
            file.copy(databasePath) ;
            QFile::setPermissions(databasePath ,QFile::WriteOwner | QFile::ReadOwner) ;
        } else qDebug() << "the file does not exist" ;
    }

    db.setDatabaseName(databasePath);

    LoadCfg();
}

QString DBManager::AdultPercent() const
{
    return m_AdultPercent;
}

QString DBManager::ChildPercent() const
{
    return m_ChildPercent;
}

QString DBManager::XRayCost() const
{
    return m_XRayCost;
}

bool DBManager::isDayDataExist(QDate date)
{
    QString fulldate = QString::number(date.day()) +"."+ QString::number(date.month()) +"."+QString::number(date.year());

    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT * FROM data WHERE Date = '"+fulldate+"'");

    db.close();

    bool result = false;

    while(query.next())
    {
        if(query.value(0).toInt() != 0)
            result = true;
    }

    return result;
}

void DBManager::setAdultPercent(QString AdultPercent)
{
    if (m_AdultPercent == AdultPercent)
        return;

    m_AdultPercent = AdultPercent;
    emit AdultPercentChanged(m_AdultPercent);
}

void DBManager::setChildPercent(QString ChildPercent)
{
    if (m_ChildPercent == ChildPercent)
        return;

    m_ChildPercent = ChildPercent;
    emit ChildPercentChanged(m_ChildPercent);
}

void DBManager::setXRayCost(QString XRayCost)
{
    if (m_XRayCost == XRayCost)
        return;

    m_XRayCost = XRayCost;
    emit XRayCostChanged(m_XRayCost);
}

void DBManager::saveCfg()
{
    db.open();

    QSqlQuery query;

    query.exec("UPDATE config SET value ='" + m_AdultPercent +"' WHERE name = 'AdultPercent'");
    query.exec("UPDATE config SET value ='" + m_ChildPercent +"' WHERE name = 'ChildPercent'");
    query.exec("UPDATE config SET value ='" + m_XRayCost +"' WHERE name = 'XRayCost'");

    db.close();
}

void DBManager::LoadCfg()
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return;
    }

    QSqlQuery query;

    query.exec("SELECT * FROM config");

    while(query.next())
    {
        if(query.value(0).toString() == "AdultPercent")
            m_AdultPercent = query.value(1).toString();

        if(query.value(0).toString() == "ChildPercent")
            m_ChildPercent = query.value(1).toString();

        if(query.value(0).toString() == "XRayCost")
            m_XRayCost = query.value(1).toString();
    }

    db.close();
}
