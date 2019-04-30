#ifndef XMLMANAGER_H
#define XMLMANAGER_H

#include <QObject>

class XMLManager : public QObject
{
    Q_OBJECT
public:
    explicit XMLManager(QObject *parent = nullptr);

signals:

public slots:

private:
    void writeToXML();

};

#endif // XMLMANAGER_H
