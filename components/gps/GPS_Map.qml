import QtQuick 2.12
import QtLocation 5.12
import QtPositioning 5.12
import Qt.labs.location 1.0
import QtQml 2.12

Rectangle {

    property ListModel waypoint_model: ListModel{}
    property int map_width: 450
    property int map_height: 450
    property var drone_coord: QtPositioning.coordinate(-19.871904, -43.966248)

    id: map_area
    width: map_width; height: map_height
    color: "black"

    Plugin { // Plugin used by the Map object. Defines the groundstation's map provider
        id: mapPlugin
        name: "osm"
    }

    Map { // Object that displays the map
        id: gps_map
        anchors {
            fill: parent
            margins: 1
        }
        plugin: mapPlugin
        center: drone_coord
        zoomLevel: 14
        copyrightsVisible: false


        MapQuickItem { // Displays an icon that represents the UAV's location
            id: drone
            coordinate: drone_coord
            sourceItem: Image {
                id: drone_icon
                source: "qrc:/img/gps/drone_icon.svg"
                sourceSize.height: 40; sourceSize.width: 40

            }
            anchorPoint.x: drone_icon.width/2; anchorPoint.y: drone_icon.height/2

        }

        ListModel{ id: waypoints} // List of waypoints (Exemple Only)

        MapItemView { // Loads the waypoint icon in the coordinates listed in the model
            model: waypoints
            delegate:  MapQuickItem {
                coordinate: QtPositioning.coordinate(coordinate_x, coordinate_y)
                sourceItem: Image {
                    id: marker_icon
                    source: "qrc:/img/gps/pin_icon.svg"
                    sourceSize.height: 40; sourceSize.width: 40

                }
                anchorPoint.x: marker_icon.width/2; anchorPoint.y: 32

            }
        }

        MapPolyline { // links the waypoints with a red line, symbolizing the UAV's trajectory
            id: trajectory
            line {
                width: 2
                color: "red"
            }
            path: [
                drone.coordinate
            ]
        }

        MouseArea { // Enables adding waypoints by double clicking the map (Example Only)
            anchors.fill: parent
            onDoubleClicked: {
                var coord = gps_map.toCoordinate(Qt.point(mouse.x, mouse.y))
                var coord_x = coord.latitude
                var coord_y = coord.longitude
                waypoints.append({coordinate_x : coord_x, coordinate_y: coord_y})
                trajectory.addCoordinate(coord)
            }
        }

    }
}

