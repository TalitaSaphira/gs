import QtQuick 2.0

Item { // Sets the GraphPlot display mode

    property string view_mode: "zoom_out"

    Rectangle {
        width: 100; height: 100
        color: mouse_area.pressed ? "#969696" : "lightgrey"
        border {
            width: 2
            color: "grey"
        }

        Text {
            id: text
            anchors.centerIn: parent
            text: qsTr("Zoom\nOut")
            font.pixelSize: 18
        }

        MouseArea {
            id: mouse_area
            anchors.fill: parent
            onPressed: {
                if (text.text == "Zoom\nOut"){
                    text.text =  qsTr("Zoom\nIn");
                    view_mode = "zoom_out";
                }else if(text.text == "Zoom\nIn"){
                    text.text =  qsTr("Zoom\nOut");
                    view_mode = "zoom_in";
                }

            }
        }
    }
}
