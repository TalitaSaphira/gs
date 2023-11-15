import QtQuick 2.0

Item {
    // Sensor Inputs
    property real pressure: 28
    property real altitude: 0

    Rectangle {
        height: 175; width: 175
        color: "Gainsboro"

        Image { // Altimeter background
            anchors.fill: parent
            z: 1
            source: "qrc:/img/altimiter/alt_face_2.svg"
        }

        Image { // Altimeter case
            anchors.fill: parent
            z: 2
            source: "qrc:/img/altimiter/alt_case.svg"
        }

        Image { // Rotates according to the mesured pressure value
            id: alt_pressure
            anchors.fill: parent
            source: "qrc:/img/altimiter/alt_face_1.svg"
            rotation: (pressure - 28) * (-100)
        }

        Image { // Handles the ten thousand meters pointer
            id: hand_10000
            anchors.fill: parent
            z: 3
            rotation: altitude * 0.0036
            source: "qrc:/img/altimiter/alt_face_3.svg"
        }

        Image { // Handles the thousand meters pointer
            id: hand_1000
            anchors.fill: parent
            z: 4
            rotation: altitude * 0.036
            source: "qrc:/img/altimiter/alt_hand_1.svg"
        }

        Image { // Handles the hundred meters pointer
            id: hand_100
            anchors.fill: parent
            z: 5
            rotation: (altitude % 1000) * 0.36
            source: "qrc:/img/altimiter/alt_hand_2.svg"
        }
    }

}
