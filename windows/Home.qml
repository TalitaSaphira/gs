import QtQuick 2.12
import QtQuick.Controls 2.12
import QtLocation 5.12
import QtPositioning 5.12
import Qt.labs.location 1.0
import QtQml 2.12
import "../components/sensors"
import "../components/gps"

/* This code is responsible for the functions displayed in the Home mode */

Component {

    Item {

        Connections { // Component that links back-end variables with their correspondent front-end object

            target: _backend // All sensor variables are grouped in one object
            /* NOTE: Sensor values that are also displayed at GraphsView mode should be read in vector form,
            as is stablished in the airspeed case*/
            onAirspeedChanged: airspeed.sensor_value = value[1]
            onRollChanged: attitude.roll = value[1]
            onPitchChanged: attitude.pitch = value[1]
            onHeadingChanged: heading.heading = value[1]
            onAltitudeChanged: altitude.sensor_value = value[1]
            onPressureChanged: pressure.sensor_value = value[1]
            onSideslipChanged: sideslip.sensor_value = value[1]
            onFVelocityChanged: forward_velocity.sensor_value = value[1]
            onLVelocityChanged: lateral_velocity.sensor_value = value[1]
            onAngleofAttackChanged: angle_of_attack.sensor_value = value[1]
            onTiltAngleLChanged: tilt_angle_left.sensor_value = value[1]
            onTiltAngleRChanged: tilt_angle_right.sensor_value = value[1]
            onAileronLChanged: aileron_left.sensor_value = value[1]
            onAileronRChanged: aileron_right.sensor_value = value[1]
            onRuddervatorLChanged: ruddervator_left.sensor_value = value[1]
            onRuddervatorRChanged: ruddervator_right.sensor_value = value[1]
            onThrustLChanged: thrust_left.sensor_value = value[1]
            onThrustRChanged: thrust_right.sensor_value = value[1]
            onLatitudeChanged: latitude.sensor_value = value[1]
            onLongitudeChanged: longitude.sensor_value = value[1]

            onNewLogMsg: alert_msg.text = log_msg
            //onGpsChanged: gps_display.drone_coord = QtPositioning.coordinate(coord[1], coord[2])
        }

        Rectangle { // Object that displays the last log message recieved

            id: alert_log
            width: 350; height: 50
            color: "#FF6666"
            radius: 10
            anchors {
                top: start_button.bottom; topMargin: 10
                left: parent.left; leftMargin: 25
            }


            Text {
                id: alert_msg
                anchors {
                    fill: parent
                    margins: 10
                }

                text: "No Log"
                font.pixelSize: 14

            }

        }

        Item { // Instrumentation container with different types of sensor displays

            id: instrumentation
            width: 550; height: 350
            anchors {
                top: parent.top; topMargin: 25
                right: parent.right; rightMargin: 100
            }

//            Altimeter { // Displays the aircraft's pressure and the altitude
//                id: altimiter
//                anchors {
//                    top: parent.top; right: parent.right
//                    rightMargin: 175
//                }
//                pressure: 28
//                altitude: 0

//            }


            VerticalBar {
                id: airspeed
                sensor_name: "Airspeed (m/s)"
                //rotation: 90
                sensor_value: 50
                sensor_zero: 0
                sensor_25: 12.5
                sensor_50: 25
                sensor_75: 37.5
                sensor_max: 50
                anchors {
                    bottom: parent.bottom; bottomMargin: -15
                    left: tilt_angle_right.right; leftMargin: 22.5
                }
            }


            VerticalBar {
                id: altitude
                sensor_name: "Altitude (m)"
                //rotation: 90
                sensor_value: 50
                sensor_zero: 0
                sensor_25: 100
                sensor_50: 200
                sensor_75: 300
                sensor_max: 400
                anchors {
                    bottom: parent.bottom; bottomMargin: 67.5
                    left: ruddervator_right.right; leftMargin: 22.5
                }
            }

            VerticalBar {
                id: pressure
                sensor_name: "Pressure (atm)"
                //rotation: 90
                sensor_value: 1
                sensor_zero: 0
                sensor_25: 2.5
                sensor_50: 5
                sensor_75: 7.5
                sensor_max: 10
                anchors {
                    bottom: parent.bottom; bottomMargin: 150
                    left: aileron_right.right; leftMargin: 22.5
                }
            }

            LCD_Display {
                id: aileron_left
                sensor_name: "Aileron\nLeft (deg)"
                sensor_value: -30
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: aileron_right.bottom
                }
            }

            LCD_Display {
                id: aileron_right
                sensor_name: "Aileron\nRight (deg)"
                sensor_value: -30
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: heading.bottom; topMargin: 195
                }
            }

            LCD_Display {
                id: ruddervator_left
                sensor_name: "Ruddervator\nLeft (deg)"
                sensor_value: -30
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: ruddervator_right.bottom
                }
            }

            LCD_Display {
                id: ruddervator_right
                sensor_name: "Ruddervator\nRight (deg)"
                sensor_value: -30
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: aileron_left.bottom
                }
            }

            LCD_Display {
                id: tilt_angle_left
                sensor_name: "Tilt angle\nLeft (deg)"
                sensor_value: 120
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: tilt_angle_right.bottom
                }
            }

            LCD_Display {
                id: tilt_angle_right
                sensor_name: "Tilt angle\nRight (deg)"
                sensor_value: 120
                anchors {
                    left: parent.left; leftMargin: 32.5
                    top: ruddervator_left.bottom
                }
            }

            LCD_Display {
                id: thrust_left
                sensor_name: "Thrust\nLeft (%)"
                sensor_value: -30
                anchors {
                    left: pressure.left; leftMargin: 200
                    top: thrust_right.bottom
                }
            }

            LCD_Display {
                id: thrust_right
                sensor_name: "Thrust\nRight (%)"
                sensor_value: -30
                anchors {
                    left: pressure.left; leftMargin: 200
                    top: heading.bottom; topMargin: 195
                }
            }

            LCD_Display {
                id: angle_of_attack
                sensor_name: "Angle of\nAttack (deg)"
                sensor_value: -30
                anchors {
                    left: altitude.left; leftMargin: 200
                    top: thrust_left.bottom
                }
            }

            LCD_Display {
                id: sideslip
                sensor_name: "Sideslip (deg)"
                sensor_value: 30
                anchors {
                    left: altitude.left; leftMargin: 200
                    top: angle_of_attack.bottom
                }
            }

            LCD_Display {
                id: forward_velocity
                sensor_name: "Forward\nVelocity (m/s)"
                sensor_value: -30
                anchors {
                    left: airspeed.left; leftMargin: 200
                    top: sideslip.bottom
                }
            }

            LCD_Display {
                id: lateral_velocity
                sensor_name: "Lateral\nVelocity (m/s)"
                sensor_value: -30
                anchors {
                    left: airspeed.left; leftMargin: 200
                    top: forward_velocity.bottom
                }
            }


//            AirSpeed { // Displays the aircraft's air speed
//                id: airspeed
//                anchors {
//                    top: parent.top; left: parent.left
//                }
//                speed: 17
//            }

//            TurnCoordinator { // Displays the aircraft's turn rate and if the turning maneuver is being efficient (sideslip)
//                id: turn_coordinator
//                anchors {
//                    top: airspeed.bottom;
//                    topMargin: 175
//                }
//                sideslip: 0
//                turn_rate: 0
//            }

            Attitude { // Displays the aircraft's roll and pitch orientation
                id: attitude
                anchors {
                    top: parent.top; left: vertical_speed.right
                    leftMargin: 187.5
                }
                roll: 0
                pitch: 0
            }

            Heading { // Displays the yaw orientation
                id: heading
                anchors {
                    top: parent.top; left: attitude.right
                    leftMargin: 187.5
                }
                heading: 0
            }

            VerticalSpeed { // Displays the vertical speed
                id:vertical_speed
                anchors {
                    top: parent.top; left: parent.left
                    leftMargin: 25
                }
                climb_rate: 0
            }
        }

        GPS_Map { // Object used to display the map
            id: gps_display
            width: 350; height: 350
            anchors {
                left: parent.left; leftMargin: 25
                top: parent.top; topMargin: 25
            }
        }

        Button { // Starts Flight
            id: start_button
            anchors {   // Location
                top: gps_display.bottom; topMargin: 10
                left: parent.left; leftMargin: 35
            }
            contentItem: Text { // What's written on the button
                anchors.centerIn: start_button.background
                text: qsTr("Start Button")
                font.pixelSize: 18
            }
            background:  Rectangle { // Button appearence
                width: 150; height: 30
                color: start_button.pressed ? "#969696" : "lightgrey" // Shades the button when clicked
                border {
                    width: 2
                    color: "grey"
                }
            }
            onPressed: alert_msg.text = qsTr("Start Flight") // Button Effect
        }

        Button { // Emergency stop button
            id: emergency_button
            anchors {
                top: gps_display.bottom; topMargin: 10
                right: gps_display.right; rightMargin: 10
            }
            contentItem: Text {
                anchors.centerIn: emergency_button.background
                text: qsTr("Emergency Stop")
                font.pixelSize: 18
            }
            background: Rectangle {
                width: 150; height: 30
                color: emergency_button.pressed ? "#969696" : "lightgrey"

                border {
                    width: 2
                    color: "grey"
                }
            }
            onPressed: alert_msg.text =  qsTr("Emergency Stop");
        }
    }
}

