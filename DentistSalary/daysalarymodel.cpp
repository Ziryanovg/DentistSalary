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
    case CommandRole:
        return m_data.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> DaySalaryModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[CommandRole] = "command";

    return roles;
}

void DaySalaryModel::add(QString command)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(command);
    endInsertRows();

    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
}
