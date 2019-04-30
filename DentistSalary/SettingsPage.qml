import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: element

    Rectangle
    {
        id: rectAdultPercent
        height: 50
        color: "gray"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: textAdultPercent
            height: 24
            text: qsTr("Процент взрослые:")
            font.pointSize: 15
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            border.color: "black"
            border.width: 1

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: textAdultPercent.bottom
            anchors.topMargin: 0

            TextInput {
                id: inputAdultPercent
                font.capitalization: Font.AllLowercase
                anchors.fill: parent
                font.pixelSize: 20
                text: DBManager.AdultPercent
            }
        }


    }

    Rectangle
    {
        id: rectChildPercent
        height: 50
        color: "gray"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectAdultPercent.bottom
        anchors.topMargin: 0

        Text {
            id: textChildPercent
            text: qsTr("Процент дети:")
            font.pointSize: 15
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            border.color: "black"
            border.width: 1

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: textChildPercent.bottom
            anchors.topMargin: 0

            TextInput {
                id: inputChildPercent
                text: DBManager.ChildPercent
                anchors.fill: parent
                font.pixelSize: 20
            }
        }


    }

    Rectangle
    {
        id: rectXRayPrice
        height: 50
        color: "gray"
        anchors.top: rectChildPercent.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Text {
            id: textXRay
            text: qsTr("Стоимость рентгена:")
            font.pointSize: 15
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            border.color: "black"
            border.width: 1

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: textXRay.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5

            TextInput {
                id: inputXRayCost
                text: DBManager.XRayCost
                anchors.fill: parent
                font.pixelSize: 20
            }
        }


    }

}
