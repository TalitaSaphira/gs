import QtQuick 2.0
import QtQuick.Controls 2.12
import QtCharts 2.3
import QtQml 2.12
import "../components"

Component {
Item {

    property int i: 0

    anchors.fill: parent

        Rectangle { // UAV's actuator signal displayer container
            id: actuator_plot
            width: 800; height: 200
            anchors {
                top: parent.top; topMargin: 25
                left: parent.left; leftMargin: 25
            }
            border {
                width: 1
                color: "black"
            }

            ChartView { // Object responsible for the ploting itself
                anchors.fill: parent
                antialiasing: true
                margins {
                    top: 5; bottom: 5; left: 5; right:5
                }

                legend.visible: false
                animationOptions: ChartView.SeriesAnimations

                ValueAxis { // Defines the plot X axis range
                    id: axisX
                    min: 0
                    max: 30
                    tickCount: 11
                    labelFormat: "%d"
                }

                ValueAxis { // Defines the plot Y axis range
                    id: axisY
                    min: actuator_console.min_axis
                    max: actuator_console.max_axis
                    tickCount: 5
                }

                LineSeries { // Defines what type of graphic is going to be plotted and specifies its data
                    id: series_1
                    axisX: axisX
                    axisY: axisY
                    width: 1
                    color: "#A50000"
                    visible: actuator_console.visible_1

                }

                LineSeries { // Defines what type of graphic is going to be plotted and specifies its data
                    id: series_2
                    axisX: axisX
                    axisY: axisY
                    width: 1
                    color: "green"
                    visible: actuator_console.visible_2

                }

                LineSeries { // Defines what type of graphic is going to be plotted and specifies its data
                    id: series_3
                    axisX: axisX
                    axisY: axisY
                    width: 1
                    color: "blue"
                    visible: actuator_console.visible_3

                }

                LineSeries { // Defines what type of graphic is going to be plotted and specifies its data
                    id: series_4
                    axisX: axisX
                    axisY: axisY
                    width: 1
                    color: "purple"
                    visible: actuator_console.visible_4

                }

                LineSeries { // Defines what type of graphic is going to be plotted and specifies its data
                    id: series_5
                    axisX: axisX
                    axisY: axisY
                    width: 1
                    color: "orange"
                    visible: actuator_console.visible_5

                }

            }
        }

        Actuator_Console { // Object created to handle the actuator being plotted and allowing the user to set a gain for the motor
            id: actuator_console
            width: 800; height: 200
            anchors {
                bottom: parent.bottom; bottomMargin: 25
                left: parent.left; leftMargin: 25
            }
        }

        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: {
                series_1.append(series_1.count, actuator_console.slider1_value);
                series_2.append(series_2.count, actuator_console.slider2_value);
                series_3.append(series_3.count, actuator_console.slider3_value);
                series_4.append(series_4.count, actuator_console.slider4_value);
                series_5.append(series_5.count, actuator_console.slider5_value);

                if (series_1.count > 30){
                    axisX.min = series_1.at(series_1.count - 1).x - 30;
                    axisX.max = series_1.at(series_1.count - 1).x + 1;}
                else if(series_1.count < 30){
                    axisX.min = 0}


            }
        }
    }
}
