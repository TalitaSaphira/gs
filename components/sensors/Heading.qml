import QtQuick 2.0

Item {
    // Sensor Input
    property real heading: 0

    Rectangle { // Indicates the UAV's yaw orientation
        height: 175; width: 175
        color: "Gainsboro"

        Image {
            source: "qrc:/img/heading/hsi_face.svg"
            rotation: -heading
            anchors.fill: parent
        }

        Image {
            id: hd_case
            anchors.fill: parent
            z: 1
            source: "qrc:/img/heading/hsi_case.svg"
        }
    }
}
