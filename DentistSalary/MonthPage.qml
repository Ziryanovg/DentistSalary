import QtQuick 2.0

Item
{
    property var result: DBModel.getDataMonthResult()
    property var month
    property var year

    function setMonthYear(yearparam,monthparam)
    {
        year = yearparam

        switch (monthparam)
        {
        case 1:month = "январь";
            break;
        case 2:month =  "февраль";
            break;
        case 3:month =  "март";
            break;
        case 4:month =  "апрель";
            break;
        case 5:month =  "май";
            break;
        case 6:month =  "июнь";
            break;
        case 7:month =  "июль";
            break;
        case 8:month =  "август";
            break;
        case 9:month =  "сентябрь";
            break;
        case 10:month =  "октябрь";
            break;
        case 11:month =  "ноябрь";
            break;
        case 12:month =  "декабрь";
            break;
        }
    }


    id: element
    Rectangle
    {
        z:2
        id:rectResult
        color: "beige"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        height: 50

        Text {
            id: textResult
            text: "Сумма за "+ month +" "+ year + " года: "+parseFloat(DBModel.getDataMonthResult()).toFixed(2);
            font.pointSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Flickable
    {
        id:flick
        flickableDirection: Flickable.HorizontalFlick
        z:1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: rectResult.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        interactive: true

        contentWidth: 727; contentHeight: 300

        MonthListViewHeader
        {
            id:header
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            z:2
        }

        ListView
        {
            id:list
            anchors.top: header.bottom
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            interactive: true

            model: DBModel

            delegate: MonthModelDelegate{}

        }
    }
}





/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
