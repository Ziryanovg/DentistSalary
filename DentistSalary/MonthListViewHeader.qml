import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    id: rectangle
    height: 50

    border.width: 1
    border.color: "black"

    Row
    {
        id: row
        anchors.fill: parent
        spacing: 10

        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }

        Text
        {
            id: textDate
            width: 100
            text: qsTr("Дата")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }

        Text
        {
            id: textResult
            width: 100
            text: qsTr("Итого")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }


        Text
        {
            id: textAdultSumm
            width: 100
            text: qsTr("Cумма взрослые")
            anchors.verticalCenter: parent.verticalCenter
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }


        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }

        Text
        {
            id: textAdultXRay
            width: 100
            text: qsTr("Рентген взрослые")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }


        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }

        Text
        {
            id: textChildSumm
            width: 100
            text: qsTr("Сумма дети")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }



        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }

        Text
        {
            id: textChildXRay
            width: 100
            text: qsTr("Рентген дети")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        Rectangle
        {
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            width: 1
            color: "black"
        }
    }
}
