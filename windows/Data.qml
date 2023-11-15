import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12
import "../components/graphics"
import "../components"

Component {
    Item {
        anchors.fill: parent

        DataCheckbox { // Object used to handle the data selected to be exported
            id: data_console
            w: 700; h: 200
            anchors {
                top: parent.top; left: parent.left
                topMargin: 25; leftMargin: 25
            }
        }

        Generic_Console { // Displays the logs recieved
            id: log_console
            anchors {
                top: data_console.bottom; left: parent.left
                topMargin: 250; leftMargin: 25
            }
            data_name: "Log"
        }

        Button { // Selects all data in the data console
            id: select_all_button
            anchors {
                left: data_console.right; top: data_console.top
                leftMargin: 725; topMargin: 10
            }
            contentItem: Text {
                anchors.centerIn: select_all_button.background
                text: qsTr("Select All")
                font.pixelSize: 18
            }
            background:  Rectangle {
                width: 150; height: 50
                color: select_all_button.pressed ? "#969696" : "lightgrey"
                border {
                    width: 2
                    color: "grey"
                }
            }
        }

        Button { // Unselectes all data in the data console
            id: clear_all_button
            anchors {
                left: data_console.right; top: select_all_button.bottom
                leftMargin: 725; topMargin: 20
            }
            contentItem: Text {
                anchors.centerIn: clear_all_button.background
                text: qsTr("Clear All")
                font.pixelSize: 18
            }
            background:  Rectangle {
                width: 150; height: 50
                color: clear_all_button.pressed ? "#969696" : "lightgrey"
                border {
                    width: 2
                    color: "grey"
                }
            }
        }

        Button { // Exports the selected data
            id: export_data_button
            anchors {
                left: data_console.right; top: clear_all_button.bottom
                leftMargin: 725; topMargin: 20
            }
            contentItem: Text {
                anchors.centerIn: export_data_button.background
                text: qsTr("Export Data")
                font.pixelSize: 18
            }
            background:  Rectangle {
                width: 150; height: 50
                color: export_data_button.pressed ? "#969696" : "lightgrey"
                border {
                    width: 2
                    color: "grey"
                }
            }
        }

        Button { // Exports the groundstation log
            id: export_log_button
            anchors {
                left: log_console.right; top: log_console.top
                leftMargin: 25; topMargin: 20
            }
            contentItem: Text {
                anchors.centerIn: export_log_button.background
                text: qsTr("Export Log")
                font.pixelSize: 18
            }
            background:  Rectangle {
                width: 150; height: 50
                color: export_log_button.pressed ? "#969696" : "lightgrey"
                border {
                    width: 2
                    color: "grey"
                }
            }
        }
    }
}

