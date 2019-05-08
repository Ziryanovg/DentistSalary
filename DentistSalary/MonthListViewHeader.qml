import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    id: rectangle
    height: 50
    border.width: 1
    border.color: "black"
    width: parent.width

    Row
    {
        id: row
        spacing: 1
        anchors.fill: parent

        Text
        {
            id: textDate
            width: parent.width*0.2
            text: qsTr("Дата")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text
        {
            id: textAdultSumm
            width: parent.width*0.2
            text: qsTr("Cумма взрослые")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text
        {
            id: textAdultXRay
            width: parent.width*0.1
            text: qsTr("Рентген взрослые")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: textChildSumm
            width: parent.width*0.2
            text: qsTr("Сумма дети")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: textChildXRay
            width: parent.width*0.1
            text: qsTr("Рентген дети")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }


        Text
        {
            id: textResult
            width: parent.width*0.2
            text: qsTr("Итого")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
