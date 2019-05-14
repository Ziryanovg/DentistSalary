import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import Qt.labs.calendar 1.0

ColumnLayout
{
    id: rectangle
    height: 30
    spacing: 0

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
            text: modelDate
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
            id: textResult
            text: result
            anchors.verticalCenter: parent.verticalCenter
            width: 100
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
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
            id: textAdultSumm
            text: adultsumm
            anchors.verticalCenter: parent.verticalCenter
            width: 100
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
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
            id: textAdultXRay
            text: adultxraycount
            anchors.verticalCenter: parent.verticalCenter
            width: 100
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
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
            text: childsumm
            anchors.verticalCenter: parent.verticalCenter
            width: 100
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
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
            text: childxraycount
            anchors.verticalCenter: parent.verticalCenter
            width: 100
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
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

    Rectangle
    {
        height: 1
        color: "black"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

}
