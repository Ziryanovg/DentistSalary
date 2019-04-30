import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: element

    Rectangle
    {
        id:rectAdult
        height: 250
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: textAdult
            height: 40
            text: qsTr("Взрослые")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 20
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Text {
            id: textAdultSum
            height: 30
            text: qsTr("Сумма:")
            font.pointSize: 18
            anchors.top: textAdult.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        Rectangle
        {
            id: rectInputAdultSum
            height: 30
            anchors.verticalCenter: textAdultSum.verticalCenter
            anchors.left: textAdultSum.right
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: textAdultSum.bottom
            anchors.topMargin: 0
            border.color: "black"
            border.width: 1

            TextInput
            {
                id:inputAdultSum
                anchors.fill: parent
            }
        }

        Text {
            id: textXRayCount
            height: 30
            text: qsTr("Кол-во рентгенов:")
            anchors.top: textAdultSum.bottom
            anchors.topMargin: 10
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        SpinBox
        {
            id:spinXRayCount
            anchors.verticalCenter: textXRayCount.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 290
            anchors.left: textXRayCount.right
            anchors.leftMargin: 0
            value: 0
            stepSize: 1
        }

        Text {
            id: textResult
            height: 30
            text: qsTr("Итого за взрослых:")
            font.pointSize: 18
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: spinXRayCount.bottom
            anchors.topMargin: 10
        }

        Rectangle
        {
            border.color: "black"
            border.width: 1

            Text {
                anchors.fill: parent
                id: textResultOutput
            }
        }
    }

//    Rectangle
//    {
//        id:rectChildren
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 0
//        anchors.top: rectAdult.bottom
//        anchors.topMargin: 0
//        anchors.right: parent.right
//        anchors.rightMargin: 0
//        anchors.left: parent.left
//        anchors.leftMargin: 0
//        Text {
//            id: textChildren
//            text: qsTr("Дети:")
//        }
//    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
