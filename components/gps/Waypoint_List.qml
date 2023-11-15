import QtQuick 2.0
import QtQml 2.12

Rectangle { // Object used to handle the waypoints. Not connected to the map at the present moment
    width: 350; height: 200
    color: "snow"
    border {
        color: "black"; width: 1
    }

    ListModel { // List of waypoints (Example Only)
        id: waypoint_model

        ListElement {
            name: "Waypoint 1"
        }

        ListElement {
            name: "Waypoint 2"
        }

        ListElement {
            name: "Waypoint 3"
        }
    }

    Component { // The delegate specifies the way the waypoint is displayed in the list
        id: waypoint_delegate
        Text {
            text: name;

            MouseArea {
                anchors.fill: parent
                onClicked: waypoint_view.currentIndex = index
                onDoubleClicked: waypoint_view.model.remove(index)

            }
        }

    }

    ListView { // Component responsible for displaying the waypoint list
        id: waypoint_view
        anchors {
            fill: parent
            topMargin: 1; leftMargin: 1
        }
        model: waypoint_model
        delegate: waypoint_delegate
        interactive: false // Denies the capability to move the list around
        highlight: Rectangle { // Enables selection Highlight
            color: "lightsteelblue"
            anchors {
                left: parent.left; right: parent.right
                rightMargin: 1;
            }
        }
        focus: true
    }
}


