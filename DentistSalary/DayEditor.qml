import QtQuick 2.0
import QtQuick.Controls 2.3


Item {
    id: element

    property real adultResult:0
    property real childResult:0
    property real result: 800
    property var dateprop
    property bool available: true

    function clearSaveBtn()
    {
        if(btnSave.text != "Сохранить")
            btnSave.text = "Сохранить"
    }

    function newDate(newdate)
    {
        date.text = newdate.getDate()+"."+newdate.getMonth()+"."+newdate.getFullYear()
        dateprop = newdate
        inputAdultSum.text = DBManager.adultSum(newdate)
        inputChildSum.text = DBManager.childSum(newdate)
        spinXRayCount.value = DBManager.adultXRayCount(newdate)
        spinChildXRayCount.value = DBManager.childXRayCount(newdate)
    }

    function calcAdult()
    {
        var sum = Number(inputAdultSum.text)

        if(isNaN(sum))
        {
            rectInputAdultSum.border.color = "red"
            available = false
            return
        }

        rectInputAdultSum.border.color = "black"

        adultResult = (sum - (spinXRayCount.value * DBManager.XRayCost)) * DBManager.AdultPercent / 100

        calcResult()
    }

    function calcChild()
    {
        var sum = Number(inputChildSum.text)

        if(isNaN(sum))
        {
            rectInputChildSum.border.color = "red"
            available = false
            return
        }

        rectInputChildSum.border.color = "black"

        childResult = (sum - (spinChildXRayCount.value * DBManager.XRayCost)) * DBManager.ChildPercent / 100

        calcResult()
    }

    function calcResult()
    {
        clearSaveBtn()

        result = childResult + adultResult
        if (result < 800) result =800
        available = true
    }

    Text {
        id: date
        height: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 20
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

    Rectangle
    {
        id:rectAdult
        height: 154
        anchors.top: date.bottom
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
            border.color: "black"
            border.width: 1

            TextInput
            {
                id:inputAdultSum
                text: "0"
                anchors.fill: parent
                font.pointSize: 25

                onTextChanged: calcAdult()
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
            anchors.left: textXRayCount.right
            anchors.leftMargin: 5
            width: 150
            value: 0
            stepSize: 1

            onValueChanged: calcAdult()
        }

        Text {
            id: textResult
            height: 30
            text: qsTr("Итого за взрослых:")
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: textXRayCount.bottom
            anchors.topMargin: 10
        }

        Text {
            id: textResultOutput
            font.pointSize: 25
            text: adultResult
            anchors.verticalCenter: textResult.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textResult.right
            anchors.leftMargin: 5
        }
    }

    Rectangle
    {
        id:rectChild
        height: 200
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectAdult.bottom
        anchors.topMargin: 0

        Text {
            id: textChild
            height: 40
            text: qsTr("Дети")
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
            id: textChildSum
            height: 30
            text: qsTr("Сумма:")
            font.pointSize: 18
            anchors.top: textChild.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        Rectangle
        {
            id: rectInputChildSum
            height: 30
            anchors.verticalCenter: textChildSum.verticalCenter
            anchors.left: textChildSum.right
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            border.color: "black"
            border.width: 1

            TextInput
            {
                id:inputChildSum
                text: "0"
                anchors.fill: parent
                font.pointSize: 25

                onTextChanged: calcChild()
            }
        }

        Text {
            id: textChildXRayCount
            height: 30
            text: qsTr("Кол-во рентгенов:")
            anchors.top: textChildSum.bottom
            anchors.topMargin: 10
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        SpinBox
        {
            id:spinChildXRayCount
            anchors.verticalCenter: textChildXRayCount.verticalCenter
            anchors.left: textChildXRayCount.right
            anchors.leftMargin: 5
            width: 150
            value: 0
            stepSize: 1

            onValueChanged: calcChild()
        }

        Text {
            id: textChildResult
            height: 30
            text: qsTr("Итого за взрослых:")
            font.pointSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: textChildXRayCount.bottom
            anchors.topMargin: 10
        }

        Text {
            id: textChildResultOutput
            font.pointSize: 25
            text: childResult
            anchors.verticalCenter: textChildResult.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textChildResult.right
            anchors.leftMargin: 5
        }
    }

    Rectangle
    {
        id: rectFullResult
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: rectChild.bottom
        anchors.topMargin: 0
        Text {
            id: textFullResult
            height: 30
            text: "Итого:"
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.pointSize: 18
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: textFullResultOutput
            text: result
            anchors.verticalCenter: textFullResult.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textFullResult.right
            anchors.leftMargin: 5
            font.pointSize: 25
        }
    }

    Button
    {
        id: btnSave
        text: "Сохранить"
        anchors.top: rectFullResult.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        onClicked:
        {
            if(available)
            {
                DBManager.saveDay(dateprop,inputAdultSum.text,inputChildSum.text,spinXRayCount.value,spinChildXRayCount.value);
                btnSave.text = "Сохранено"
            }
            else
            {
                btnSave.text = "Исправьте данные!"
            }
        }
    }

}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
