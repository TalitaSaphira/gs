import QtQuick 2.0
import QtCharts 2.0
import QtQml 2.12
import QtQuick.Controls 2.12
import "../components/graphics"

/* Code responsible for the Graphsview mode. It displays all sensor and actuator values in time */

Component {

    Item {

        Item {  // Container for all state-related objects

            id: state_displayer
            width: 924; height: 200
            anchors {
                top: parent.top; left: parent.left
                topMargin: 25; leftMargin: 25
            }

            ListModel { // Model responsible for the graphic settings of each item being displayed
                id: state_list

                ListElement {
                        name: "Roll"        // State name
                        boxstate: false     // If it's being displayed or not
                        boxcolor: "green"   // Graphic color
                        min: -45            // Y-axis minimum value
                        max: 45             // Y-axis maximum value
                }

                ListElement {
                        name: "Pitch"
                        boxstate: false
                        boxcolor: "blue"
                        min: -45
                        max: 45
                }

                ListElement {
                        name: "Heading"
                        boxstate: false
                        boxcolor: "purple"
                        min: -180
                        max: 180
                }

                ListElement {
                        name: "Airspeed"
                        boxstate: false
                        boxcolor: "#A50000"
                        min: 0
                        max: 50
                }

                ListElement {
                        name: "Pressure"
                        boxstate: false
                        boxcolor: "orange"
                        min: -400
                        max: 400
                }

                ListElement {
                        name: "Altitude"
                        boxstate: false
                        boxcolor: "cyan"
                        min: -500
                        max: 500
                }
            }

            Connections { // Updates the graphic
                target: _backend
                onRollChanged: state_plot_area.variable_1 = value
                onPitchChanged: state_plot_area.variable_2 = value
                onHeadingChanged: state_plot_area.variable_3 = value
                onAirspeedChanged: state_plot_area.variable_4 = value
                onPressureChanged: state_plot_area.variable_5 = value
                onAltitudeChanged: state_plot_area.variable_6 = value

            }

            Plotter { // Graphic area designated for displaying the UAV's state data
                id: state_plot_area
                anchors {
                    top: parent.top; left: parent.left
                }
                axis_mode: state_zoom_button.view_mode
                min_y_axis: state_selection.min_axis
                max_y_axis: state_selection.max_axis
                model_1: roll_model
                model_2: pitch_model
                model_3: heading_model
                model_4: airspeed_model

                //model_5: pressure_model
                //model_6: altitude_model

                visible_1: state_selection.visible_1
                visible_2: state_selection.visible_2
                visible_3: state_selection.visible_3
                visible_4: state_selection.visible_4

                visible_5: state_selection.visible_5
                visible_6: state_selection.visible_6

            }

            DataCheckbox { // Checkbox used to specify what state data is going to be displayed
                id: state_selection
                w: 250; h: 200
                anchors {
                    top: parent.top; left: state_plot_area.right
                    leftMargin: 550
                }
                data_model: state_list
            }

            View_Button { // Switches the graphic display between since the beginning of the flight and the last 10 interactions
                id: state_zoom_button
                anchors {
                    top: parent.top; left: state_selection.left
                    topMargin: 50; leftMargin: 275
                }
                view_mode: "zoom_in"
            }
        }

        Item {  // Container for all input-related objects

            id: input_displayer
            width: 924; height: 200
            anchors {
                top: state_displayer.bottom; left: parent.left
                topMargin: 50; leftMargin: 25
            }

            ListModel {
                id: input_list

                ListElement {
                        name: "Aileron right"
                        boxstate: true
                        boxcolor: "red"
                        min: 0
                        max: 100
                }

                ListElement {
                        name: "Aileron left"
                        boxstate: false
                        boxcolor: "green"
                        min: 0
                        max: 100
                }

                ListElement {
                        name: "Ruddervator right"
                        boxstate: false
                        boxcolor: "blue"
                        min: 0
                        max: 100

                }

                ListElement {
                        name: "Ruddervator left"
                        boxstate: false
                        boxcolor: "orange"
                        min: 0
                        max: 100
                }

                ListElement {
                        name: "Tilt angle right"
                        boxstate: false
                        boxcolor: "purple"
                        min: 0
                        max: 100

                }

                ListElement {
                        name: "Tilt angle left"
                        boxstate: false
                        boxcolor: "yellow"
                        min: 0
                        max: 100

                }
            }

            Connections {
                target: _backend
                onAileronRChanged: input_plot_area.variable_1 = value
                onAileronLChanged: input_plot_area.variable_2 = value
                onRuddervatorRChanged: input_plot_area.variable_3 = value
                onRuddervatorLChanged: input_plot_area.variable_4 = value
                onTiltRAngleChanged: input_plot_area.variable_5 = value
                onTiltLAngleChanged: input_plot_area.variable_6 = value
            }

            Plotter { // Graphic area designated for displaying the UAV's state data
                id: input_plot_area
                anchors {
                    top: parent.top; left: parent.left
                }
                axis_mode: input_zoom_button.view_mode
                min_y_axis: input_selection.min_axis
                max_y_axis: input_selection.max_axis
                model_1: aileronr_model
                model_2: aileronl_model
                model_3: ruddervatorr_model
                model_4: ruddervatorl_model
                //model_5: tiltrangle_model
                //model_6: tiltlangle_model
                variable_1: ListModel {}
                visible_1: input_selection.visible_1
                visible_2: input_selection.visible_2
                visible_3: input_selection.visible_3
                visible_4: input_selection.visible_4
                visible_5: input_selection.visible_5
                visible_6: input_selection.visible_6
            }

            DataCheckbox { // Checkbox used to specify what state data is going to be displayed
                id: input_selection
                w: 250; h: 200
                anchors {
                    top: parent.top; left: input_plot_area.right
                    leftMargin: 550
                }
                data_model: input_list
            }

            View_Button { // Switches the graphic display between since the beginning of the flight and the last 10 interactions
                id: input_zoom_button
                anchors {
                    top: parent.top; left: input_selection.left
                    topMargin: 50; leftMargin: 275
                }
                view_mode: "zoom_in"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
