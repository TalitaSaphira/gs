import QtQuick 2.0

Item {
    property real speed: 0 // Sensor reading

    Rectangle {
        height: 175; width: 175
        color: "Gainsboro"

        Image { // airspeed sensor background
            anchors.fill: parent
            source: "qrc:/img/airspeed/asi_face.svg"
        }

        Image { // airspeed pointer handler
            id: asi_hand
            anchors.fill: parent
            z: 1
            source: "qrc:/img/airspeed/asi_hand.svg"
            rotation: { // The pointer has different behaviors depending on the speed value
                if (speed < 10.0)
                    speed* 3.6
                else if ( speed < 17.5)
                    36 + 7.2 * (speed - 10)
                else if (speed < 32.5)
                    90 + 8 * (speed - 17.5)
                else if (speed < 40)
                    210 + 7.2 * (speed - 32.5)
                else
                    264 + 4.8 * (speed - 40)}
        }

        Image { // airspeed sensor foreground
            anchors.fill: parent
            z: 2
            source: "qrc:/img/airspeed/asi_case.svg"
        }

    }
}
