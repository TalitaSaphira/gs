import QtQuick 2.12
import QtQuick.Controls 2.12


Item {
    width: 300; height: 125

    Rectangle {
        anchors.fill: parent
        border {
            color: "black"; width: 3
        }
        color: "lightgrey"

        Text {
            text: qsTr("Operation Mode")
            font {
                pixelSize: 25
            }
            anchors {
                top: parent.top; topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
        }

        ComboBox {
            model: ["Automatic", "Teleop"]
            anchors {
                bottom: parent.bottom; bottomMargin: 25
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

    }
}
