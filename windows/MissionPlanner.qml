import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQml 2.12
import QtLocation 5.12
import QtPositioning 5.12
import Qt.labs.location 1.0
import "../components/gps"

Component {

    Item {
        anchors.fill: parent

        Connections {   // Updates UAV position in the map
            target: _backend
            onGpsChanged: map_area.drone_coord = QtPositioning.coordinate(coord[1], coord[2])
        }

        Rectangle {
            color: "lightgrey"
            anchors.fill: parent

            GPS_Map { // Displays the groundstation's map
                id: map_area
                width: 450; height: 450
                anchors {
                    bottom: parent.bottom; left: parent.left
                    bottomMargin: 25; leftMargin: 25
                }

            }

            Waypoint_List { // Object responsible for managing the UAV's waypoints
                id: waypoint_list
                anchors {
                    top: map_area.top; left: map_area.right
                    leftMargin: 25
                }
            }

            Button { // Sets custom algorimths
                id: custom_algo_button
                anchors {
                    right: waypoint_list.right; top: waypoint_list.bottom
                    topMargin: 25; rightMargin: 26
                }
                contentItem: Text {
                    anchors.centerIn: custom_algo_button.background
                    text: qsTr("Custom Algo")
                    font.pixelSize: 18
                }
                background:  Rectangle {
                    width: 150; height: 50
                    color: custom_algo_button.pressed ? "#969696" : "lightgrey"
                    anchors {
                        right: waypoint_list.right; top: waypoint_list.bottom
                        topMargin: 25
                    }
                    border {
                        width: 2
                        color: "grey"
                    }
                }
            }


            Button { // Displays the trajectory preview in the map
                id: preview_button
                anchors {
                    left: waypoint_list.left; top: waypoint_list.bottom
                    topMargin: 25;
                }
                contentItem: Text {
                    anchors.centerIn: preview_button.background
                    text: qsTr("Preview")
                    font.pixelSize: 18
                }
                background:  Rectangle {
                    width: 150; height: 50
                    color: preview_button.pressed ? "#969696" : "lightgrey"
                    border {
                        width: 2
                        color: "grey"
                    }
                }
            }
        }
    }
}
