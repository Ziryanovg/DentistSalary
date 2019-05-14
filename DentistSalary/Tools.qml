import QtQuick 2.0

Rectangle
{
    signal btnBackClicked
    signal btnDayEditClicked
    signal btnSettingsClicked
    signal btnDayClearClicked
    signal btnMonthClicked

    id: toolbar
    height: 50
    color: "gray"

    state: "calendar"


    states: [
        State {
            name: "calendar"
            PropertyChanges {
                target: btnDayEdit
                visible:true
            }
            PropertyChanges {
                target: btnDayClear
                visible:true
            }
            PropertyChanges {
                target: btnMonth
                visible:true
            }
        },
        State {
            name: "other"
            PropertyChanges {
                target: btnDayEdit
                visible:false
            }
            PropertyChanges {
                target: btnDayClear
                visible:false
            }
            PropertyChanges {
                target: btnMonth
                visible:false
            }
        }
    ]

    Row
    {
        id: row
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        Image {
            id: btnBack
            width: 50
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            source: "qrc:/img/img/back_2.png"
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    btnBackClicked()
                    toolbar.state = "calendar"
                }
            }
        }

        Image {
            id: btnDayEdit
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            source: "qrc:/img/img/edit.png"
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    btnDayEditClicked()
                    toolbar.state = "other"
                }
            }
        }

        Image {
            id: btnDayClear
            width: 50
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            source: "qrc:/img/img/clear.png"
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    btnDayClearClicked()
                }
            }
        }

        Image {
            id: btnMonth
            width: 50
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            source: "qrc:/img/img/month.png"
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    btnMonthClicked()
                    toolbar.state = "other"
                }
            }
        }
    }

    Image {
        id: btnSettings
        source: "qrc:/img/img/settings_2.png"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 10
        width: height

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                btnSettingsClicked()
                toolbar.state = "other"
            }
        }
    }

}
