import QtQuick 2.0

Item {
    // Sensor Inputs
    property real sideslip: 0
    property real turn_rate: 0

    Rectangle {
        height: 175; width: 175
        color: "lightgrey"

        Image {
            anchors.fill: parent
            source: "qrc:/img/turn_coordinator/tc_back.svg"
        }

        Image { // The ball indicates the aircraft's sideslip. The sideslip indicates how optimum is the turning maneuver
            id: tc_ball
            anchors.fill: parent
            z: 2
            source: "qrc:/img/turn_coordinator/tc_ball.svg"
            transform: Rotation {
                origin.x: 87.5; origin.y: -36
                angle: -sideslip * 15
            }
        }

        Image {
            anchors.fill: parent
            z: 3
            source: "qrc:/img/turn_coordinator/tc_face_1.svg"
        }

        Image { // Displays the aircraft's turning rate
            id: tc_mark
            anchors.fill: parent
            z: 3
            source: "qrc:/img/turn_coordinator/tc_mark.svg"
            rotation: (turn_rate / 3.0) * 20.0
            }


        Image {
            anchors.fill: parent
            z: 4
            source: "qrc:/img/turn_coordinator/tc_face_2.svg"
        }

        Image {
            anchors.fill: parent
            z: 5
            source: "qrc:/img/turn_coordinator/tc_case.svg"
        }
    }
}
