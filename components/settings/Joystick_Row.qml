import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

Item {
    width: 400; height: 30
    property string row_name: "   x   "
    property ListModel cb_list: ListModel {ListElement {name: "Roll"}}

    Row {
        id: x_control
        spacing: 20

        Text {
            text: row_name
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
        }

        ComboBox {
            model: cb_list
            delegate: Text {
                text: name
            }

            width: 100; height: 30
            background: Rectangle {
                width: 100; height: 30
                border {
                    color: "darkgrey"
                    width: 2
                }
                color: "lightgrey"
            }
        }

        SpinBox {
            width: 90; height: 30
            value: 0
            up.indicator: Rectangle {
                 x: parent.width - width
                 height: parent.height
                 implicitWidth: 30
                 implicitHeight: 30
                 color: parent.up.pressed ? "#e4e4e4" : "#f6f6f6"
                 border.color: "darkgrey"

                 Text {
                     text: "+"
                     font.pixelSize: 15
                     anchors.fill: parent
                     fontSizeMode: Text.Fit
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }

             down.indicator: Rectangle {
                 x: 0
                 height: parent.height
                 implicitWidth: 30
                 implicitHeight: 30
                 color: parent.down.pressed ? "#e4e4e4" : "#f6f6f6"
                 border.color: "darkgrey"

                 Text {
                     text: "-"
                     font.pixelSize: 15
                     anchors.fill: parent
                     fontSizeMode: Text.Fit
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }
        }

        SpinBox {
            width: 90; height: 30
            value: 0
            up.indicator: Rectangle {
                 x: parent.width - width
                 height: parent.height
                 implicitWidth: 30
                 implicitHeight: 30
                 color: parent.up.pressed ? "#e4e4e4" : "#f6f6f6"
                 border.color: "darkgrey"

                 Text {
                     text: "+"
                     font.pixelSize: 15
                     anchors.fill: parent
                     fontSizeMode: Text.Fit
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }

             down.indicator: Rectangle {
                 x: 0
                 height: parent.height
                 implicitWidth: 30
                 implicitHeight: 30
                 color: parent.down.pressed ? "#e4e4e4" : "#f6f6f6"
                 border.color: "darkgrey"

                 Text {
                     text: "-"
                     font.pixelSize: 15
                     anchors.fill: parent
                     fontSizeMode: Text.Fit
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter
                 }
             }
        }
    }
}
