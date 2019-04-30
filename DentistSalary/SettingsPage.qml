import QtQuick 2.0

Item {
    id: element
    Text {
        id: textSettings
        text: qsTr("Настройки")
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

    Rectangle
    {
        id: rectAdultPercent
        height: 50
        color: "gray"
        anchors.top: textSettings.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: textAdultPercent
            text: qsTr("Процент взрослые:")
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

            TextEdit
            {
                id:editAdultPercent
                anchors.fill: parent
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

            TextEdit
            {
                id:editChildtPercent
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.fill: parent
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

            TextEdit
            {
                id:editXRay
                anchors.fill: parent
            }
        }


    }

}
