import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQml 2.12
import "../components/settings"

Component {
    Item {
        anchors.fill: parent

        Operation_Mode { // UAV mode selection
            id: operation_mode
            anchors {
                top: parent.top; topMargin: 50
                left: parent.left; leftMargin: 50
            }
        }

        Communication_Settings { // UAV-groundstation communication settings
            id: communication
            anchors {
                top: operation_mode.bottom; topMargin: 25
                left: operation_mode.left;
            }
        }

        UAV_Selection { // Selects the UAV being used and allows the creation of new UAVs
            id: uav
            anchors {
                top: parent.top; topMargin: 50
                left: operation_mode.right; leftMargin: 50
            }
        }

//        Joystick_Settings { // Sets the joystick configuration
//            id: joystick
//            anchors {
//                bottom: parent.bottom; bottomMargin: 25
//                left: operation_mode.right; leftMargin: 50
//            }
//        }
    }
}
