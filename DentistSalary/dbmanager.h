#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QDate>


enum db_names {
    index = 0,
    date = 1,
    adult_sum = 2,
    adult_xray = 3,
    child_sum = 4,
    child_xray = 5
};

struct dateinfo
{
    QString date;
    QString adultsumm;
    QString childsumm;
    QString adultxray;
    QString childxray;
    qreal result=0.0;
};

class DBManager : public QObject
{
    Q_OBJECT
public:
    static DBManager& getInstance(){
        static DBManager instance;
        return instance;
    }

    Q_PROPERTY(QString AdultPercent READ AdultPercent WRITE setAdultPercent NOTIFY AdultPercentChanged)
    Q_PROPERTY(QString ChildPercent READ ChildPercent WRITE setChildPercent NOTIFY ChildPercentChanged)
    Q_PROPERTY(QString XRayCost READ XRayCost WRITE setXRayCost NOTIFY XRayCostChanged)
    QString AdultPercent() const;
    QString ChildPercent() const;
    QString XRayCost() const;

    Q_INVOKABLE bool isDayDataExist(QDate date);
    Q_INVOKABLE qreal adultSum(QDate date);
    Q_INVOKABLE qreal childSum(QDate date);
    Q_INVOKABLE quint8 adultXRayCount(QDate date);
    Q_INVOKABLE quint8 childXRayCount(QDate date);
    Q_INVOKABLE void saveDay(QDate date,qreal adultSumm,qreal childSumm,int adultXRay, int childXRay);
    Q_INVOKABLE void clearDay(QDate date);

    QList<dateinfo> getModelData(int year, int month);
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
    explicit DBManager(QObject *parent = nullptr);
    DBManager(const DBManager&);
    DBManager& operator=(DBManager&);
    QSqlDatabase db;
    QString m_AdultPercent;
    QString m_ChildPercent;
    QString m_XRayCost;

    void LoadCfg();
};

#endif // DBMANAGER_H
