import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5


Window {
    id: window
    visible: true
    width: 640
    height: 480

    DeleteDayDialog{
        id:deleteDialog
        onYes:
        {
            DBManager.clearDay(loader.item.selectedDate)
            loader.source = ""
            loader.source = "qrc:/CalendarPage.qml"
        }
    }

    Tools
    {
        id:toolBar
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        onBtnBackClicked: loader.source = "qrc:/CalendarPage.qml"
        onBtnSettingsClicked: loader.source = "qrc:/SettingsPage.qml"
        onBtnDayEditClicked:
        {
            var date = loader.item.selectedDate
            loader.source = "qrc:/DayEditor.qml"
            loader.item.newDate(date)
        }
        onBtnDayClearClicked:
        {
            deleteDialog.open()
        }

        onBtnMonthClicked:
        {
            var month = loader.item.visibleMonth+1;
            var year = loader.item.visibleYear;
            DBModel.fillDataFromDBMgn(year,month)
            loader.source = "qrc:/MonthPage.qml"
            loader.item.setMonthYear(year,month)
        }
    }

    Loader
    {
        id:loader
        anchors.top: toolBar.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        source:"qrc:/CalendarPage.qml"
    }


}
