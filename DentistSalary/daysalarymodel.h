#ifndef DAYSALARYMODEL_H
#define DAYSALARYMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "dbmanager.h"

struct dateinfo;

class DaySalaryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
            Date = Qt::UserRole + 1,
            AdultSumm, AdultXRayCount, ChildSumm, ChildXRayCount,Result
        };

    explicit DaySalaryModel(QObject *parent = nullptr,DBManager* mgn=nullptr);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void fillDataFromDBMgn(int year, int month);
    Q_INVOKABLE qreal getDataMonthResult();
signals:

public slots:

private:
    QList<dateinfo> m_data;
    DBManager* m_dbmanager;
    qreal m_dataResult;

};

#endif // DAYSALARYMODEL_H
