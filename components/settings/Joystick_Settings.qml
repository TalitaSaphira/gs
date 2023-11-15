import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    width: 450; height: 225

    Rectangle {
        anchors.fill: parent
        border {
            color: "black"; width: 3
        }
        color: "lightgrey"

        Text {
            text: qsTr("Joystick")
            font {
                pixelSize: 25
            }
            anchors {
                top: parent.top; topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
        }

        Joystick_Row {
            id: x_control
            anchors {
                top: parent.top; topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
        }

        Joystick_Row {
            id: y_control
            anchors {
                top: parent.top; topMargin: 90
                horizontalCenter: parent.horizontalCenter
            }
            row_name: "   y   "
            cb_list: ListModel { ListElement { name: "Pitch"}}
        }

        Joystick_Row {
            id: z_control
            anchors {
                top: parent.top; topMargin: 130
                horizontalCenter: parent.horizontalCenter
            }
            row_name: "   z   "
            cb_list: ListModel { ListElement { name: "z"}}
        }

        Joystick_Row {
            id: yaw_control
            anchors {
                top: parent.top; topMargin: 170
                horizontalCenter: parent.horizontalCenter
            }
            row_name: "yaw"
            cb_list: ListModel { ListElement { name: "Yaw"}}
        }
    }
}
