import QtQuick 2.0

ListView
{
    id:list
    anchors.fill: parent

    model: DBModel

    delegate: MonthModelDelegate

}
