import QtQuick 2.12
import QtCharts 2.3
import QtQml 2.12

Item { // Object that plots a given data_set
    property string axis_mode: "zoom_out"
    property int max_y_axis: 10
    property int min_y_axis: 0
    property bool visible_1: false
    property bool visible_2: false
    property bool visible_3: false
    property bool visible_4: false
    property bool visible_5: false
    property bool visible_6: false
    property ListModel model_1: ListModel {}
    property ListModel model_2: ListModel {}
    property ListModel model_3: ListModel {}
    property ListModel model_4: ListModel {}
    property var variable_1: []
    property var variable_2: []
    property var variable_3: []
    property var variable_4: []
    property real i: 0

    // Update Datasets
    onVariable_1Changed: {console.log(variable_1)
        series_1.append(variable_1[0],variable_1[1]);
        if (series_1.count > 10 && plot_area.state == "zoom_in"){
            axisX.min = series_1.at(series_1.count - 1).x - 10;}
        else if(series_1.count < 300){
            axisX.min = 0}
        else{
            axisX.min = series_1.at(series_1.count - 1).x - 300;
        }
        axisX.max = series_1.at(series_1.count - 1).x + 1;
        }
    onVariable_2Changed: { series_2.append(variable_2[0],variable_2[1]);}
    onVariable_3Changed: { series_3.append(variable_3[0],variable_3[1]);}
    onVariable_4Changed: { series_4.append(variable_4[0],variable_4[1]);}

    Rectangle {

        id: plot_area
        color: "snow"
        width: 500; height: 200
        border {
            width: 1; color: "black"
        }
        state: axis_mode
        states: [
            State {
                name: "zoom_out"
            },

            State {
                name: "zoom_in"
            }
        ]

        ChartView { // Plots the data
            id: chart
            anchors.fill: parent
            antialiasing: true
            margins {
                top: 5; bottom: 5; left: 5; right:5
            }    
            legend.visible: false

            animationOptions: ChartView.SeriesAnimations



            ValueAxis { // Defines the X axis
                id: axisX
                min: 0
                max: 10
                tickCount: 11
                labelFormat: "%d"
                labelsAngle: 45
                labelsFont.pixelSize: 12
            }

            ValueAxis { /// Defines the Y axis
                id: axisY
                min: min_y_axis
                max: max_y_axis
                tickCount: 5
                labelsFont.pixelSize: 12
            }

            SplineSeries {
                id: series_1
                axisX: axisX
                axisY: axisY
                color: "#A50000"
                visible: visible_1
            }

            SplineSeries {
                id: series_2
                axisX: axisX
                axisY: axisY
                color: "green"
                visible: visible_2
            }

            SplineSeries {
                id: series_3
                axisX: axisX
                axisY: axisY
                color: "blue"
                visible: visible_3
            }

            SplineSeries {
                id: series_4
                axisX: axisX
                axisY: axisY
                color: "purple"
                visible: visible_4
            }

            SplineSeries {
                id: series_5
                axisX: axisX
                axisY: axisY
                color: "orange"
                visible: visible_5
            }

            SplineSeries {
                id: series_6
                axisX: axisX
                axisY: axisY
                color: "cyan"
                visible: visible_6
            }

            // Load Datasets
            Component.onCompleted:  {
                for (var i = 0; i < model_1.rowCount(); i++){
                    series_1.append(model_1.get(i).value[0], model_1.get(i).value[1])
                }
                for (i = 0; i < model_2.rowCount(); i++){
                    series_2.append(model_2.get(i).value[0], model_2.get(i).value[1])
                }
                for (i = 0; i < model_3.rowCount(); i++){
                    series_3.append(model_3.get(i).value[0], model_3.get(i).value[1])
                }
                for (i = 0; i < model_4.rowCount(); i++){
                    series_4.append(model_4.get(i).value[0], model_4.get(i).value[1])
                }

            }
        }
    }
}
