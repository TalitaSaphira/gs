import QtQuick 2.0

Item {

    // Sensor Inputs
    property real roll: 0
    property real pitch: 0

    // Constant
    property real pixel_per_deg: 0.533

    Rectangle {  // THe attitude sensor indicates the aircraft's nose orientation
        height: 175; width: 175;
        color: "Gainsboro"

        Image { // Sensor Background
            id: attitude_background
            anchors.fill: parent
            rotation: -roll
            source: "qrc:/img/attitude/adi_back.svg"
        }

        Image { // Handles the sensor's mobile part, responsible to indicate the aircraft's pitch value
            id: attitude_face
            width: 175; height: 175
            x: 0; y: 0; z: 1
            rotation: -roll
            source: "qrc:/img/attitude/adi_face.svg"
            fillMode: Image.PreserveAspectFit
            transform: Translate {
                x:pixel_per_deg * pitch * Math.sin(roll*Math.PI/180)
                y: pixel_per_deg * pitch * Math.cos(roll * Math.PI/180)
                }
        }

        Image {
            id: attitude_ring
            anchors.fill: parent
            rotation: -roll
            z: 2
            source: "qrc:/img/attitude/adi_ring.svg"
        }

        Image {
            id: attitude_case
            anchors.fill: parent
            z: 3
            source: "qrc:/img/attitude/adi_case.svg"
        }
    }

}
