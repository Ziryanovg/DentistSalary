#include "daysalarymodel.h"
#include <QDebug>
#include <math.h>

DaySalaryModel::DaySalaryModel(QObject *parent, DBManager* mgn) : QAbstractListModel(parent),m_dbmanager(mgn)
{

}

int DaySalaryModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant DaySalaryModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case Date:
    {
        QString strdate = m_data.at(index.row()).date;
        QString year = strdate.mid(0,4);
        QString month = strdate.mid(5,2);
        QString day = strdate.mid(8,2);
        return day+"."+month+"."+year;
    }
    case AdultSumm:
        return m_data.at(index.row()).adultsumm;
    case AdultXRayCount:
        return m_data.at(index.row()).adultxray;
    case ChildSumm:
        return m_data.at(index.row()).childsumm;
    case ChildXRayCount:
        return m_data.at(index.row()).childxray;
    case Result:
    {
        qDebug() << m_data.at(index.row()).result;
        return m_data.at(index.row()).result;
    }
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> DaySalaryModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Date] = "modelDate";
    roles[AdultSumm] = "adultsumm";
    roles[AdultXRayCount] = "adultxraycount";
    roles[ChildSumm] = "childsumm";
    roles[ChildXRayCount] = "childxraycount";
    roles[Result] = "result";

    return roles;
}

void DaySalaryModel::fillDataFromDBMgn(int year, int month)
{
   m_data.clear();
   m_dataResult = 0.0;

   m_data.append(m_dbmanager->getModelData(year,month));

   qreal xraycost = m_dbmanager->XRayCost().toShort();
   qreal adultpercent = m_dbmanager->AdultPercent().toShort();
   qreal childpercent = m_dbmanager->ChildPercent().toShort();

   for (auto i=0;i<m_data.size();++i) {
       qreal adultsumm = m_data.at(i).adultsumm.toShort();
       int adultxray = m_data.at(i).adultxray.toInt();
       qreal childsumm = m_data.at(i).childsumm.toShort();
       int childxray = m_data.at(i).childxray.toInt();

       qreal adultresult = (adultsumm - adultxray*xraycost)*adultpercent/100;
       qreal childresult = (childsumm - childxray*xraycost)*childpercent/100;

       qreal dayresult = adultresult+childresult;

       if(dayresult<800)dayresult = 800;

       m_data[i].result = dayresult;
       m_dataResult += dayresult;
   }


}

qreal DaySalaryModel::getDataMonthResult()
{
    return m_dataResult;
}

