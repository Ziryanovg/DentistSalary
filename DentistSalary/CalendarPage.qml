import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1

Item {

    signal dateEditClicked(var selectedDate)


    Calendar
    {
        id:calendar
        anchors.topMargin: 0
        anchors.fill: parent
        frameVisible: true
        selectedDate: new Date()
        focus: true
        locale: Qt.locale("ru_RU")
        onPressAndHold:
        {
            contextMenu.popup()
        }

        Menu {
            id: contextMenu
            MenuItem {
                text: "Редактировать"
                onTriggered:{
                    dateEditClicked(calendar.selectedDate)
                }
            }
        }


        style: CalendarStyle {
            dayDelegate: Rectangle {
                radius: 40

                Rectangle {
                    anchors.fill: parent
                    border.color:styleData.date !== undefined &&  styleData.selected ? "blue" : "transparent"
                    color: DBManager.isDayDataExist(styleData.date) ? "green" : "white"
                    radius: 40
                }


                Label {
                    id: dayDelegateText
                    text: styleData.date.getDate()
                    anchors.centerIn: parent
                    color: {
                        var color = "gray";
                        if (styleData.valid) {
                            // Date is within the valid range.
                            color = styleData.visibleMonth ? "black" : "gray";
                            if (styleData.selected) {
                                color = "black";
                            }
                        }
                        color;
                    }
                }
            }
        }
    }

}
