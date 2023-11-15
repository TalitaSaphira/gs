import QtQuick 2.0

Item {
    // Sensor Input
    property real climb_rate: 0

    Rectangle {
        height: 175; width: 175
        color: "Gainsboro"

        Image {
            anchors.fill: parent
            source: "qrc:/img/vertical_speed/vsi_face.svg"
        }

        Image { // Handles the climb rate pointer position
            id: vsi_hand
            anchors.fill: parent
            z: 1
            source: "qrc:/img/vertical_speed/vsi_hand.svg"
            rotation: climb_rate * 8.6
        }


        Image {
            anchors.fill: parent
            source: "qrc:/img/vertical_speed/vsi_case.svg"
        }
    }

}
