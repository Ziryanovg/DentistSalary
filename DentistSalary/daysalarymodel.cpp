#include "daysalarymodel.h"

DaySalaryModel::DaySalaryModel(QObject *parent) : QAbstractListModel(parent)
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
    case AdultSumm:
        return m_data.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> DaySalaryModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[AdultSumm] = "AdultSumm";

    return roles;
}
