import QtQuick 2.0
import QtQml.Models 2.12


Rectangle {

     property string data_name: "value"

    id: csl
    width: 700; height: 200
    color: "snow"
    border {
        color: "black"; width: 1
    }

    ListView {
        id: view
        anchors {
            fill: parent
            topMargin: 1; leftMargin: 1
        }
        model: model
        delegate: delegate
        interactive: false
        highlight: Rectangle {
            color: "lightsteelblue"
            anchors {
                left: parent.left; right: parent.right
                rightMargin: 1;
            }
        }
        focus: true
    }

    ListModel {
        id: model

        Component.onCompleted: {
            [
                {
                    txt: data_name + " 1",
                },
                {
                txt: data_name + " 2",
                }
            ].forEach(function(e) { append(e); });
        }
    }

    Component {
        id: delegate

        Text {
            text: txt
            font.pixelSize: 20

            MouseArea {
                anchors.fill: parent
                onClicked: view.currentIndex = index
            }
        }
    }
}
