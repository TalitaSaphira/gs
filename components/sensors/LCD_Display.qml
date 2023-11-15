import QtQuick 2.0

Item {
    property string sensor_name: "Sensor\nName"
    property real sensor_value: 0
     height: 40; width: 160

     Rectangle {
         height: 40; width: 101
         color: "silver"
         border {
             color: "DimGray"
             width: 2
         }

         Text {
             anchors.fill: parent
             horizontalAlignment: Text.AlignHCenter
             verticalAlignment:  Text.AlignVCenter
             anchors {
                 left: parent.left; margins: 2
             }
             text: qsTr(sensor_name)
             font.pixelSize: 13
         }
     }

     Rectangle {
         height: 40; width: 60
         anchors {
             right: parent.right
         }

         color: "black"
         border {
             color: "DimGray"
             width: 2
         }

         Text {
             id: value
             anchors { fill: parent; margins: 2}
             horizontalAlignment: Text.AlignRight
             verticalAlignment: Text.AlignVCenter
             text: sensor_value
             font {family: lcd_font.name; pixelSize: 35}
             color: "SpringGreen"
         }
     }
}
