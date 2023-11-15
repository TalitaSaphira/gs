import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

ApplicationWindow {
    id: edit_window

    width: 400; height: 225

    Connections {
        target: edit_button
        onEdit_mode: setEditMode(mode)
    }

    function setEditMode(edit_mode) {
        if(edit_mode === "Serial"){
            title.text = "Serial Connection"

            first_parameter_text.text = "Port"
            first_parameter_edit.placeholderText = "/dev/tty or COM"

            second_parameter_text.text = "Bauderate"
            second_parameter_edit.placeholderText = "Bauderate Value"

        }
        else if(edit_mode === "UDP/TCP"){
            title.text = "UDP/TCP Connection"

            first_parameter_text.text = "Port"
            first_parameter_edit.placeholderText = "Port Number"

            second_parameter_text.text = "IP Address"
            second_parameter_edit.placeholderText = "IP Address"
        }

    }

    Rectangle {
        anchors.fill: parent
        color: "lightgrey"

        Text {
            id: title
            text: ""
            anchors {
                top: parent.top; topMargin: 25
                horizontalCenter: parent.horizontalCenter
            }
            font {
                bold: true
                pixelSize: 25
                underline: true
            }
        }

        Text {
            id: first_parameter_text
            text: ""
            anchors {
                top: title.bottom; topMargin: 25
                left: parent.left; leftMargin: 25
            }
            font.bold: true
         }

        Rectangle {
            height: 25; width: 250
            anchors {
                verticalCenter: first_parameter_text.verticalCenter;
                right: parent.right; rightMargin: 25
            }
            color: "white"
            border {
                color: "black"
                width: 1

            }
         }

         TextArea {
             id: first_parameter_edit

             height: 23; width: 248
             placeholderText: ""
             font {
                 pixelSize: 12
             }

             anchors {
                 verticalCenter: first_parameter_text.verticalCenter;
                 right: parent.right; rightMargin: 26

             }

             verticalAlignment: Text.AlignVCenter

         }

         Text {
             id: second_parameter_text
             text: ""
             anchors {
                 top: first_parameter_text.bottom; topMargin: 25
                 left: parent.left; leftMargin: 25
             }
             font.bold: true
          }

         Rectangle {
             height: 25; width: 250
             anchors {
                 verticalCenter: second_parameter_text.verticalCenter;
                 right: parent.right; rightMargin: 25
             }
             color: "white"
             border {
                 color: "black"
                 width: 1

             }
          }

          TextArea {
              id: second_parameter_edit

              height: 23; width: 248
              placeholderText: ""
              font {
                  pixelSize: 12
              }

              anchors {
                  verticalCenter: second_parameter_text.verticalCenter;
                  right: parent.right; rightMargin: 26

              }
              verticalAlignment: Text.AlignVCenter
        }

          Button {
              id: accept_button
              width: 200; height: 40
              signal send_parameters(var parameters)
              anchors {
                  top: second_parameter_text.bottom; topMargin: 25
                  horizontalCenter: parent.horizontalCenter;
               }
              contentItem: Text {
                  anchors.fill: parent
                  text: qsTr("Accept")
                  font.pixelSize: 18
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
              }
              background: Rectangle {
                  anchors.fill: parent
                  color:  accept_button.pressed ? "#969696" : "lightgrey"

                  border {
                      width: 2
                      color: "grey"
                  }

              }

              onClicked: {
                communication.param_1 = first_parameter_edit.text
                communication.param_2 = second_parameter_edit.text
                edit_window.close()
              }
         }
    }
}
