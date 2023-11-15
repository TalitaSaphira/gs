import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    width: 300; height: 175

    Rectangle {
        anchors.fill: parent
        border {
            color: "black"; width: 3
        }
        color: "lightgrey"

        Text {
            text: qsTr("UAV")
            font {
                pixelSize: 25
            }
            anchors {
                top: parent.top; topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
        }

        ComboBox {
            model: ["Tilt-rotor 4.0"]
            anchors {
                bottom: parent.bottom; bottomMargin: 75
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
            id: create_new_uav_button
            width: 125; height: 40
            anchors {
                bottom: parent.bottom; bottomMargin: 25
                right: parent.right; rightMargin: 25
            }
            contentItem: Text {
                text: qsTr("Create New")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle{
                color: create_new_uav_button.pressed ? "#969696" : "lightgrey"

                border {
                    width: 2
                    color: "grey"
                }
            }
        }
    }
}
