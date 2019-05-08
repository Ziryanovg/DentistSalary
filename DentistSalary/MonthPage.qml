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
            font.pointSize: 30
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    ListView
    {
        id:list
        anchors.top: rectResult.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        interactive: false

        model: DBModel

        header: MonthListViewHeader{}

        delegate: MonthModelDelegate{}

    }
}
