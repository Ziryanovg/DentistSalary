import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1

Calendar
{
    id:calendar
    selectedDate: new Date()


    focus: true
    locale: Qt.locale("ru_RU")


    style: CalendarStyle {
        gridVisible: false
        dayDelegate: Item {
            Rectangle {
                anchors.fill: parent
                border.color:styleData.date !== undefined &&  styleData.selected ? "blue" : "transparent"
                color: DBManager.isDayDataExist(styleData.date) ? "green" : "white"
                radius: 60
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
