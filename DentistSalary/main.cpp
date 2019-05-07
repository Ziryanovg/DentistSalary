#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "dbmanager.h"
#include "daysalarymodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    DBManager mgn;
    DaySalaryModel model(nullptr,&mgn);

    engine.rootContext()->setContextProperty("DBManager",&mgn);
    engine.rootContext()->setContextProperty("DBModel",&model);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
