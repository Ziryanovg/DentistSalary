import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle
    {
        id: toolbar
        height: 50
        color: "gray"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Button
        {
            id: btnBack
            text: "back"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 60
            onClicked:
            {
                swipe.currentIndex = 0
            }
        }

        Text {
            id: label
            text: "Главная"
            font.pointSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: btnSettings.left
            anchors.rightMargin: 0
            anchors.left: btnBack.right
            anchors.leftMargin: 0
        }

        Button
        {
            id: btnSettings
            text: "settings"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 10
            width: 60
            onClicked:
            {
                swipe.currentIndex = 1
            }
        }
    }

    SwipeView
    {
        id: swipe
        anchors.top: toolbar.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        currentIndex: 0
        interactive: false

        Item {
            id: calendarPage
            CalendarPage
            {
                anchors.topMargin: 5
                anchors.fill: parent
                onDateEditClicked:
                {
                    swipe.currentIndex = 2
                    dayEditComp.newDate(selectedDate)
                }
            }
        }

        Item
        {
            id:settingsPage
            SettingsPage{
                anchors.fill: parent
                onSaveCfg: swipe.currentIndex = 0
            }
        }

        Item {
            id: dayEditorPage
            DayEditor
            {
                id:dayEditComp
                anchors.fill: parent
            }
        }

        onCurrentIndexChanged:
        {
            switch(currentIndex) {
              case 0:
                label.text = "Главная"
                break

              case 1:
                label.text = "Настройки"
                break
            }
        }
    }
}
