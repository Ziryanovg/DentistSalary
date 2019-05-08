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

    if(!f.exists())
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

QString QDateToQString(QDate& date)
{
    QString month = QString::number(date.month());
    if(month.size()==1)
        month = '0'+month;

    QString day = QString::number(date.day());
    if(day.size()==1)
        day = '0'+day;

    return QString::number(date.year())+"-"+ month +"-"+ day;
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
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT * FROM data WHERE Date = '"+QDateToQString(date)+"'");

    db.close();

    bool result = false;

    while(query.next())
    {
        if(query.value(db_names::index).toInt() != 0)
            result = true;
    }

    return result;
}

qreal DBManager::adultSum(QDate date)
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT AdultSumm FROM data WHERE Date = '"+QDateToQString(date)+"'");

    db.close();

    qreal result=0.0;

    while(query.next())
    {
        result = query.value(0).toReal();
    }

    return result;
}

qreal DBManager::childSum(QDate date)
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT ChildSumm FROM data WHERE Date = '"+QDateToQString(date)+"'");

    db.close();

    qreal result=0.0;

    while(query.next())
    {
        result = query.value(0).toReal();
    }

    return result;
}

quint8 DBManager::adultXRayCount(QDate date)
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT AdultXRay FROM data WHERE Date = '"+QDateToQString(date)+"'");

    db.close();

    quint8 result=0;

    while(query.next())
    {
        result = query.value(0).toInt();
    }

    return result;
}

quint8 DBManager::childXRayCount(QDate date)
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return false;
    }

    QSqlQuery query;

    query.exec("SELECT ChildXRay FROM data WHERE Date = '"+QDateToQString(date)+"'");

    db.close();

    quint8 result=0;

    while(query.next())
    {
        result = query.value(0).toInt();
    }

    return result;
}

void DBManager::saveDay(QDate date,qreal adultSumm, qreal childSumm, int adultXRay, int childXRay)
{
    db.open();

    QSqlQuery query;

    QString q = "INSERT INTO data (Date,AdultSumm,AdultXRay,ChildSumm,ChildXRay) VALUES ('"+QDateToQString(date)+"',"+QString::number(adultSumm)+","+QString::number(adultXRay)+","+QString::number(childSumm)+","+QString::number(childXRay)+")";

    query.exec(q);

    db.close();
}

void DBManager::clearDay(QDate date)
{
    db.open();

    QSqlQuery query;

    QString q = "DELETE FROM data WHERE Date ='"+QDateToQString(date)+"'";

    query.exec(q);

    db.close();
}

QList<dateinfo> DBManager::getModelData(int year, int month)
{
    if(!db.open())
    {
        qDebug() << "db is not opened";
        return QList<dateinfo>();
    }

    QDate low(year,month,1);
    QDate high(year,month,1);
    high.setDate(year,month,high.daysInMonth());

    QString lowdate = QDateToQString(low);
    QString highdate = QDateToQString(high);

    QSqlQuery query;

    query.exec("SELECT * FROM data WHERE Date BETWEEN date('"+lowdate+"') AND date('"+highdate+"')");

    QList<dateinfo> data;

    while(query.next())
    {
        dateinfo temp;
        temp.date = query.value(1).toString();
        temp.adultsumm = query.value(2).toString();
        temp.adultxray = query.value(3).toString();
        temp.childsumm = query.value(4).toString();
        temp.childxray = query.value(5).toString();
        data.append(temp);
    }

    for (auto i=0;i<data.size();++i) {
        qDebug() << data[i].date;
        qDebug() << data[i].adultsumm;
        qDebug() << data[i].adultxray;
        qDebug() << data[i].childsumm;
        qDebug() << data[i].childxray;
    }

    db.close();

    return data;
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
