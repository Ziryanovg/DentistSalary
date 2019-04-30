import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: element

    signal saveCfg()

    Rectangle
    {
        id: rectAdultPercent
        height: 80
        color: "gray"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: textAdultPercent
            height: 40
            text: qsTr("Процент взрослые:")
            font.pointSize: 27
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            id:rectInputAdultPercent
            height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            border.color: "black"
            border.width: 1

            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: textAdultPercent.bottom
            anchors.topMargin: 0

            TextInput {
                id: inputAdultPercent
                height: 35
                font.capitalization: Font.AllLowercase
                anchors.fill: parent
                font.pixelSize: 27
                text: DBManager.AdultPercent
                anchors.leftMargin: 2
            }
        }


    }

    Rectangle
    {
        id: rectChildPercent
        height: 80
        color: "gray"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectAdultPercent.bottom
        anchors.topMargin: 0

        Text {
            id: textChildPercent
            height: 40
            text: qsTr("Процент дети:")
            font.pointSize: 27
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            id:rectInputChildPercent
            height: 40
            border.color: "black"
            border.width: 1

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: textChildPercent.bottom
            anchors.topMargin: 0

            TextInput {
                id: inputChildPercent
                height: 35
                text: DBManager.ChildPercent
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 27
            }
        }


    }

    Rectangle
    {
        id: rectXRayPrice
        height: 80
        color: "gray"
        anchors.top: rectChildPercent.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Text {
            id: textXRay
            height: 40
            text: qsTr("Стоимость рентгена:")
            font.pointSize: 27
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle
        {
            id:rectInputXRayCost
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
                height: 35
                text: DBManager.XRayCost
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 27
            }
        }
    }

    Button
    {
        text: "Сохранить"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        onClicked:
        {
            var available = true

            if(isNaN(Number(inputAdultPercent.text)))
            {
                rectInputAdultPercent.border.color = "red"
                available = false
            }
            else
            {
                rectInputAdultPercent.border.color = "black"
                DBManager.setAdultPercent(inputAdultPercent.text)
            }

            if(isNaN(Number(inputChildPercent.text)))
            {
               rectInputChildPercent.border.color = "red"
               available = false
            }
            else
            {
                rectInputChildPercent.border.color = "black"
                DBManager.setChildPercent(inputChildPercent.text)
            }

            if(isNaN(Number(inputXRayCost.text)))
            {
                rectInputXRayCost.border.color = "red"
                available = false
            }
            else
            {
                rectInputXRayCost.border.color = "black"
                DBManager.setXRayCost(inputXRayCost.text)
            }

            if(available)
            {
                DBManager.saveCfg();
                saveCfg()
            }

        }
    }
}







/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_height:20;anchors_width:80;anchors_x:179;anchors_y:252}
D{i:3;anchors_height:30}D{i:8;anchors_height:20;anchors_width:80;anchors_x:143;anchors_y:149}
D{i:12;anchors_height:20;anchors_width:80;anchors_x:377;anchors_y:214}
}
 ##^##*/
