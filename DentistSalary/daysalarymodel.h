#ifndef DAYSALARYMODEL_H
#define DAYSALARYMODEL_H

#include <QObject>
#include <QAbstractListModel>

class DaySalaryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
            AdultSumm = Qt::UserRole + 1
        };

    explicit DaySalaryModel(QObject *parent = nullptr);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

signals:

public slots:

private:
    QStringList m_data;
};

#endif // DAYSALARYMODEL_H
