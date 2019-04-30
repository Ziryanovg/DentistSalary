#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QObject>
#include <QSqlDatabase>

class DBManager : public QObject
{
    Q_OBJECT
public:
    explicit DBManager(QObject *parent = nullptr);
    Q_PROPERTY(QString AdultPercent READ AdultPercent WRITE setAdultPercent NOTIFY AdultPercentChanged)
    Q_PROPERTY(QString ChildPercent READ ChildPercent WRITE setChildPercent NOTIFY ChildPercentChanged)
    Q_PROPERTY(QString XRayCost READ XRayCost WRITE setXRayCost NOTIFY XRayCostChanged)
    QString AdultPercent() const;
    QString ChildPercent() const;
    QString XRayCost() const;

signals:

    void AdultPercentChanged(QString AdultPercent);

    void ChildPercentChanged(QString ChildPercent);

    void XRayCostChanged(QString XRayCost);

public slots:

    void setAdultPercent(QString AdultPercent);

    void setChildPercent(QString ChildPercent);

    void setXRayCost(QString XRayCost);

    void saveCfg();

private:
    QSqlDatabase db;
    QString m_AdultPercent;
    QString m_ChildPercent;
    QString m_XRayCost;

    void LoadCfg();
};

#endif // DBMANAGER_H
