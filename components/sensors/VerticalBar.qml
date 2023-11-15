import QtQuick 2.0

Item {

    property string sensor_name: "sensor_name"
    property real sensor_value: 0
    property real sensor_zero: 0
    property real sensor_25: 25
    property real sensor_50: 50
    property real sensor_75: 75
    property real sensor_max: 100

    Rectangle {
        width: 175; height: 60
        color: "Gainsboro"

        Rectangle {
            id: gauge_background
            width: 150; height: 25
            border {
                color: "grey"
                width: 1
            }
            radius: 2
            anchors.centerIn: parent
        }

        Rectangle {
            id: gauge_level
            width: (sensor_value/sensor_max)*149; height: 23
            color: "black"
            anchors{
                //horizontalCenter: gauge_background.horizontalCenter
                left:  gauge_background.left; leftMargin: 1.5
                bottom: gauge_background.bottom; bottomMargin: 0.75
            }
        }

        Text {
            text: qsTr(sensor_name)
            //rotation: 270
            font.pixelSize: 12
            anchors {
                //right: parent.right; rightMargin: 25
                bottom:parent.top; bottomMargin: -13.5
                horizontalCenter: gauge_background.horizontalCenter
            }
        }

        Text {
            id: zero_percent
            text: qsTr(" |\n" + sensor_zero)
            font.pixelSize: 11
            //rotation: 270
            anchors {
                top: parent.bottom; topMargin: -18
                left: gauge_background.left
            }
        }

        Text {
            id: _25_percent
            text: qsTr(" |\n" + sensor_25)
            font.pixelSize: 11
            anchors {
                top: parent.bottom; topMargin: -18
                //bottom: zero_percent.top; bottomMargin: 21
                left: gauge_background.left; leftMargin: 36
            }
        }

        Text {
            id: _50_percent
            text: qsTr(" |\n" + sensor_50)
            font.pixelSize: 11
            anchors {
                top: parent.bottom; topMargin: -18
                //bottom: zero_percent.top; bottomMargin: 58.5
                left: gauge_background.left; leftMargin: 72
            }
        }

        Text {
            id: _75_percent
            text: qsTr(" |\n" + sensor_75)
            font.pixelSize: 11
            anchors {
                top: parent.bottom; topMargin: -18
                //bottom: zero_percent.top; bottomMargin: 96
                left: gauge_background.left; leftMargin: 108
            }
        }

        Text {
            id: _100_percent
            text: qsTr(" |\n" + sensor_max)
            font.pixelSize: 11
            anchors {
                top: parent.bottom; topMargin: -18
                //bottom: zero_percent.top; bottomMargin: 132
                left: gauge_background.left; leftMargin: 142
            }
        }
    }



}
