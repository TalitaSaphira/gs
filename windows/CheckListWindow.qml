import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

/* Code that is responsible for the checklist mode */
Component {
    Item {
        anchors.fill: parent

        Rectangle { // Background
            color: "lightgrey"
            anchors.fill: parent

            Rectangle { // Limits and positions the checkbox grid
                height: 450; width: 800
                color: parent.color
                    anchors.centerIn: parent

                Grid {
                    flow: Grid.TopToBottom // Makes the grid be filled top to bottom, left to right

                   CheckBox { // Checkbox item
                        checked: false              // Box state
                        text: qsTr("First Task")    // Box label
                   }
                   CheckBox {
                        checked: false
                        text: qsTr("Second Task")
                   }
                   CheckBox {
                        checked: false
                        text: qsTr("Third Task")
                   }
                   CheckBox {
                        checked: false
                        text: qsTr("Forth Task")
                   }
                }
            }

        }
    }
}
