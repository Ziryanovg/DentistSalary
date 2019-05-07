#ifndef DAYSALARYMODEL_H
#define DAYSALARYMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "dbmanager.h"

class DaySalaryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
            AdultSumm = Qt::UserRole + 1
        };

    explicit DaySalaryModel(QObject *parent = nullptr,DBManager* mgn=nullptr);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;
    //void setData(QList<>)

signals:

public slots:

private:
    QStringList m_data;
    DBManager* m_dbmanager;

};

#endif // DAYSALARYMODEL_H
