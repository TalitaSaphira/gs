import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

Item { // Handles what data is being selected.

    property int w: 200
    property int h: 100
    property ListModel data_model: ListModel{}
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
        width: w; height: h
        color: "snow"
        border {
            width: 1
            color: "black"
        }

        ListView {
            id: list
            signal checked(int index, bool isChecked)
            spacing: 5
            anchors {
                fill: parent
                topMargin: 1; leftMargin: 1
            }
            model: data_model
            delegate: CheckDelegate { // Template for the Checkboxes
                text: name
                checked: boxstate
                width: w; height: 25
                indicator: Rectangle {
                    width: 20; height: 20
                    anchors {
                        top: parent.top; topMargin: 2.5
                        right: parent.right; rightMargin: 5
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


                onClicked: {
                    list.currentIndex = index
                    list.checked(list.currentIndex, checked)
                }
            }

            highlight: Rectangle {
                color: "lightsteelblue"
                anchors {
                    left: parent.left; right: parent.right
                    rightMargin: 1;
                }
            }
            focus: true

            onChecked: {
               if (index == 0){

                   if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                       visible_1 = isChecked
                       min_arr[index] = data_model.get(index).min
                       max_arr[index] = data_model.get(index).max
                   }else {
                       visible_1 = false
                       list.currentItem.checked = 0
                       min_arr[index] = 0
                       max_arr[index] = 0

                   }
               }
               else if (index == 1){

                   if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                       visible_2 = isChecked
                       min_arr[index] = data_model.get(index).min
                       max_arr[index] = data_model.get(index).max
                   }else {
                       visible_2 = false
                       list.currentItem.checked = 0
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
               else if (index == 2){

                   if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                       visible_3 = isChecked
                       min_arr[index] = data_model.get(index).min
                       max_arr[index] = data_model.get(index).max
                   }else {
                       visible_3 = false
                       list.currentItem.checked = 0
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
               else if (index == 3){

                   if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                       visible_4 = isChecked
                       min_arr[index] = data_model.get(index).min
                       max_arr[index] = data_model.get(index).max
                   }else {
                       visible_4 = false
                       list.currentItem.checked = 0
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }

               }
               else if (index == 4){

                   if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                       visible_5 = isChecked
                       min_arr[index] = data_model.get(index).min
                       max_arr[index] = data_model.get(index).max
                   }else {
                       visible_5 = false
                       list.currentItem.checked = 0
                       min_arr[index] = 0
                       max_arr[index] = 0
                   }
               }
              else if (index == 5){

                  if (list.currentItem.checked && min_arr.filter(x => x !== 0).length < 4){
                      visible_6 = isChecked
                      min_arr[index] = data_model.get(index).min
                      max_arr[index] = data_model.get(index).max
                  }else {
                      visible_6 = false
                      list.currentItem.checked = 0
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
