import QtQuick 2.0
import QtQml 2.12
import "../components"

Component {
    Item {
        anchors.fill: parent

        Generic_Console { // Generic Object created to display the board and other types of Hardware health status
            id: board_console
            anchors {
                top: parent.top; left: parent.left
                topMargin: 25; leftMargin: 25
            }
            data_name: "Board"
        }

        Generic_Console {
            id: hardware_console
            anchors {
                top: board_console.bottom; left: parent.left
                topMargin: 50; leftMargin: 25
            }
            data_name: "Console"
        }
    }
}
