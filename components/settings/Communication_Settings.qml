import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

Item {
    width: 300; height: 200
    property var param_1
    property var param_2

    Rectangle {
        anchors.fill: parent
        border {
            color: "black"; width: 3
        }
        color: "lightgrey"

        Text {
            text: qsTr("Communication")
            font {
                pixelSize: 25
            }
            anchors {
                top: parent.top; topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
        }

        ComboBox {
            id: combo_box
            model: ["Serial", "UDP/TCP"]
            anchors {
                top: parent.top; topMargin: 60
                horizontalCenter: parent.horizontalCenter
            }
            width: 250; height: 50
            background: Rectangle {
                width: 250; height: 50
                border {
                    color: "darkgrey"
                    width: 2
                }
                color: "lightgrey"
            }

        }

        Button {
            id: connect_button
            width: 100; height: 40
            anchors {
                top: combo_box.bottom; topMargin: 30
                left: combo_box.left;
             }
            contentItem: Text {
                anchors.fill: parent
                text: qsTr("Connect")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                anchors.fill: parent
                color:  connect_button.pressed ? "#969696" : "lightgrey"

                border {
                    width: 2
                    color: "grey"
                }
            }

            onClicked: main_Window.connection_settings(combo_box.currentText, param_1, param_2)
        }

        Button {
            id: edit_button
            width: 100; height: 40
            signal edit_mode(string mode)
            anchors {
                top: combo_box.bottom; topMargin: 30
                right: combo_box.right;
             }
            contentItem: Text {
                anchors.fill: parent
                text: qsTr("Edit")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                anchors.fill: parent
                color:  edit_button.pressed ? "#969696" : "lightgrey"

                border {
                    width: 2
                    color: "grey"
                }
            }

          //Component.onCompleted: edit_button.edit_mode.connect(edit_window.setEditMode)

            onClicked: {
                var component = Qt.createComponent("Edit_Window.qml")
                var window = component.createObject(this)
                edit_button.edit_mode(combo_box.currentText)
                window.show()
            }

        }
    }
}
