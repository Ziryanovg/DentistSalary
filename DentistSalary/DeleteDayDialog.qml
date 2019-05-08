import QtQuick 2.0
import QtQuick.Dialogs 1.2

Dialog {
    /* Когда деплоите под Android-устройства,
     * обязательно закоментируйте эти две строки,
     * иначе словите глюки в работе устройства
     */
    id: helloDialog
    standardButtons: Dialog.Yes | Dialog.No

    Text {
        anchors.fill: parent
        font.pointSize: 30
        text: "Удалить данные об этом дне?"
    }
}
