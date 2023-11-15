import QtQuick 2.0

Rectangle {
    property alias img_source: img.source
    property Component qml_component: value
    width: 50; height: 50
    color:  button.pressed ? "#706F6F" : "lightgrey"
    border {
        color: "black"
        width: 2

    }

    Image {
        id: img
        anchors.fill: parent; anchors.margins: 5
        source: img_source
    }

    MouseArea {
        id: button
        anchors.fill: parent
        onClicked: loader.sourceComponent(qml_component)
    }
}

