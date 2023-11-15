import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 2.15

Window {
    id: debug_window
    height: 500; width: 200

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "lightgrey"

        SpinBox {
            id: dheading
            width: 100
            height: 20
            anchors.top: parent.top
            topPadding: 8
            bottomPadding: 5
            rightPadding: 44
            padding: 6
            font.styleName: "Medium"
            to: 32
            from: 28
            stepSize: 0
            font.pointSize: 8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 40
        }

    }

}
