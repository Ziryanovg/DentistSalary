import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import Qt.labs.calendar 1.0

Rectangle
{
    height: 25
    width: parent.width
    border.width: 1
    border.color: "black"

    Row
    {
        id: row
        spacing: 1
        anchors.fill: parent

        Text
        {
            id: textDate
            text: date
            wrapMode: Text.WordWrap
            width: parent.width*0.2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text
        {
            id: textAdultSumm
            text: adultsumm
            width: parent.width*0.2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: textAdultXRay
            text: adultxraycount
            width: parent.width*0.1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: textChildSumm
            text: childsumm
            width: parent.width*0.2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        Text
        {
            id: textChildXRay
            text: childxraycount
            width: parent.width*0.1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }


        Text
        {
            id: textResult
            text: result
            width: parent.width*0.2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }
    }
}
