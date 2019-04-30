import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SwipeView
    {
        id: swipe
        anchors.bottom: toolbar.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        currentIndex: 1

        Item {
            id: calendarPage
            CalendarPage
            {
                anchors.fill: parent
                onDateEditClicked:
                {
                    var date = new Date(selectedDate)
                    console.log(date.getFullYear())
                }
            }
        }

        Item
        {
            id:settingsPage

            SettingsPage{

            }
        }
    }

    Rectangle
    {
        id: toolbar
        height: 30
        color: "gray"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left

        Button
        {
            text: "settings"
            anchors.right: parent.right
            anchors.rightMargin: 10
            width: 30
            height: 30
            onClick:
            {
                swipe.currentIndex = 2
            }
        }
    }
}
