import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12


Item {

    property real slider1_value: 0
    property real slider2_value: 0
    property real slider3_value: 0
    property real slider4_value: 0
    property real slider5_value: 0
    property bool visible_1: false
    property bool visible_2: false
    property bool visible_3: false
    property bool visible_4: false
    property bool visible_5: false
    property bool visible_6: false
    property variant min_arr: [0, 0, 0, 0, 0, 0]
    property variant max_arr: [0, 0, 0, 0, 0, 0]
    property int min_axis: 0
    property int max_axis: 0

    Rectangle {
        id: actuator_console
        width: parent.width; height: parent.height
        anchors.fill: parent
        border {
            width: 1
            color: "black"
        }

        Component {
            id: actuator_delegate
            Row {
                width: actuator_console.width; height: 30
                property bool checked: delegate_checkbox.checked
                CheckBox {
                    id: delegate_checkbox
                    text: name
                    checked: boxstate
                    width: parent.width/2
                    onClicked: { actuator_view.currentIndex = index
                        actuator_view.checked(actuator_view.currentIndex, checked)}
                    indicator: Rectangle {
                        width: 20; height: 20
                        anchors {
                            verticalCenter: parent.verticalCenter
                            right: parent.right; rightMargin: 20
                        }
                        radius: 3
                        border {
                            width: 1
                            color: "black"
                        }
                        Rectangle {
                            width: 10; height: 10
                            anchors.centerIn: parent
                            radius: 2
                            color: boxcolor
                            visible: parent.parent.checked
                        }
                    }
                }

                Slider {
                    id: delegate_slider
                    width: 300
                    from: -100; to: 100; value: 0
                    stepSize: 1
                    anchors {
                        verticalCenter: parent.verticalCenter
                    }
                    onValueChanged: {
                        actuator_view.currentIndex = index
                        actuator_view.valueChanged(actuator_view.currentIndex,  max*delegate_slider.value/100)
                    }
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("      " + delegate_slider.value + "%")
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                     text: qsTr("    " + max*delegate_slider.value/100)
                }

            }

        }

        ListModel {
            id: actuator_model
            ListElement {
                name: "Actuator 1"
                boxstate: false
                boxcolor: "#A50000"
                max: 10
                min: -10
            }

            ListElement {
                name: "Actuator 2"
                boxstate: false
                boxcolor: "green"
                max: 20
                min: -20
            }

            ListElement {
                name: "Actuator 3"
                boxstate: false
                boxcolor: "blue"
                max: 30
                min: -30
            }

            ListElement {
                name: "Actuator 4"
                boxstate: false
                boxcolor: "purple"
                max: 40
                min: -40
            }
            ListElement {
                name: "Actuator 5"
                boxcolor: "orange"
                boxstate: false
                max: 50
                min: -50
            }
        }

        ListView {
            id: actuator_view
            signal checked(int index, bool isChecked)
            signal valueChanged(int index, real value)
            anchors.fill: parent
            model: actuator_model
            delegate: actuator_delegate
            spacing: 5
            topMargin: 1
            highlight: Rectangle {
                color: "lightsteelblue"
                anchors {
                    left: parent.left; right: parent.right
                    rightMargin: 1; leftMargin: 1
                }
            }
            focus: true

            onValueChanged: {
                if(index == 0){
                    slider1_value = value
                }
                if(index == 1){
                    slider2_value = value
                }
                if(index == 2){
                    slider3_value = value
                }
                if(index == 3){
                    slider4_value = value
                }
                if(index == 4){
                    slider5_value = value
                }
            }

            onChecked: {
               if (index == 0){

                   if (actuator_view.currentItem.checked && min_arr.filter(x >= x !== 0).length < 4){
                       visible_1 = isChecked
                       min_arr[index] = actuator_model.get(index).min
                       max_arr[index] = actuator_model.get(index).max
                   }else {
                       visible_1 = false
                       min_arr[index] = 0
                       max_arr[index] = 0

                   }
               }
               else if (index == 1){

                   if (actuator_view.currentItem && min_arr.filter(x >= x !== 0).length < 4){
                       visible_2 = isChecked
                       min_arr[index] = actuator_model.get(index).min
                       max_arr[index] = actuator_model.get(index).max
                   }else {
                       visible_2 = false
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
               else if (index == 2){

                   if (actuator_view.currentItem && min_arr.filter(x >= x !== 0).length < 4){
                       visible_3 = isChecked
                       min_arr[index] = actuator_model.get(index).min
                       max_arr[index] = actuator_model.get(index).max
                   }else {
                       visible_3 = false
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
               else if (index == 3){

                   if (actuator_view.currentItem.checked && min_arr.filter(x >= x !== 0).length < 4){
                       visible_4 = isChecked
                       min_arr[index] = actuator_model.get(index).min
                       max_arr[index] = actuator_model.get(index).max
                   }else {
                       visible_4 = false
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }

               }
               else if (index == 4){

                   if (actuator_view.currentItem.checked && min_arr.filter(x >= x !== 0).length < 4){
                       visible_5 = isChecked
                       min_arr[index] = actuator_model.get(index).min
                       max_arr[index] = actuator_model.get(index).max
                   }else {
                       visible_5 = false
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
               min_axis = Math.min.apply(Math, min_arr)
               max_axis = Math.max.apply(Math, max_arr)
            }
        }

    }
}
