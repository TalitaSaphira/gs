#include "back_end.h"


Back_End::Back_End(QObject* parent): QObject(parent)
{
    //Back_End Class Constructor
}

/*void Back_End::setSensors(UAV uav_data){
    // LEAVE COMMENTED IF NOT IN USE

    // Debug Class Slot
    c++;
    m_roll.append(c);
    m_pitch.append(c);
    m_heading.append(c);
    m_airspeed.append(c);
    m_coord.append(c);

//    qInfo("Signal Recieved");
    for (Sensor sensor : uav_data.get_sensorlist()){
        if (sensor.get_name() == "ADIS IMU") {
            map<string, double>readings = sensor.get_readings();
            m_roll.append(readings["Roll"]);
            m_pitch.append(readings["Pitch"]);
            m_heading.append(readings["Yaw"]);
            emit rollChanged(m_roll);
            emit pitchChanged(m_pitch);
            emit headingChanged(m_heading);
            m_roll.clear();
            m_pitch.clear();
            m_heading.clear();

        } else if (sensor.get_name() == "3DR Pixhawk Airspeed"){
            map<string, double>readings = sensor.get_readings();
//            qInfo() << "Sended Airspeed" << readings["Airspeed"];
            m_airspeed.append(readings["Airspeed"]);
            emit airspeedChanged(m_airspeed);
            m_airspeed.clear();

        } else if (sensor.get_name() == "GPS"){
            map<string, double>readings = sensor.get_readings();
            m_coord.append(readings["Latitude"]);
            m_coord.append(readings["Longitude"]);
//            qInfo() << "Latitude: " << m_coord[1] << " Longitude: " << m_coord[2];
            emit gpsChanged(m_coord);
            m_coord.clear();

        }

    emit newLogMsg(QString().fromStdString(uav_data.getLog_msg()));
    }
}*/

/* //////////////////////////////////////////// MAVLINK SLOTS ////////////////////////////////////////////////////////// */

void Back_End::setAttitude(mavlink_attitude_t attitude){
    qInfo() << "Signal Recieved Attitude";
    c++;

    m_roll.append(c);                   // Appends the counter id
    m_roll.append(attitude.roll);       // Appends the correspondent sensor value
    emit rollChanged(m_roll);           // Emit the data to the GS
    m_roll.clear();                     // Clear the memory used by th

    m_pitch.append(c);
    m_pitch.append(attitude.pitch);
    emit pitchChanged(m_pitch);
    m_pitch.clear();

    m_heading.append(c);
    m_heading.append(attitude.yaw);
    emit headingChanged(m_heading);
    m_heading.clear();

}

void Back_End::setIMU(mavlink_hil_sensor_t imu){
    qInfo() << "Signal Recieved IMU";
    c1++;

    m_fVelocity.append(c1);
    m_fVelocity.append(imu.xacc);
    emit fVelocityChanged(m_fVelocity);
    m_fVelocity.clear();

    m_lVelocity.append(c1);
    m_lVelocity.append(imu.yacc);
    emit lVelocityChanged(m_lVelocity);
    m_lVelocity.clear();

    // m_climbrate.append(c1);
    // m_climbrate.append(imu.zacc);
    // emit climbrateChanged(m_climbrate);
    // m_climbrate.clear();

    // m_angleofAttack.append(c1);
    // m_angleofAttack.append(imu.xgyro);
    // emit angleofAttackChanged(m_angleofAttack);
    // m_angleofAttack.clear();

    // m_tiltAngle.append(c1);
    // m_tiltAngle.append(imu.ygyro);
    // emit tiltAngleChanged(m_tiltAngle);
    // m_tiltAngle.clear();

    // m_sideslip.append(c1);
    // m_sideslip.append(imu.zgyro);
    // emit sideslipChanged(m_sideslip);
    // m_sideslip.clear();

    // m_pressure.append(c1);
    // m_pressure.append(imu.xgyro);
    // emit pressureChanged(m_pressure);
    // m_pressure.clear();
}

//void Back_End::setStatustext(mavlink_statustext_t statustext){
//    c2++;
//}

void Back_End::setAirspeed(mavlink_airspeed_t airspeed){
    qInfo() << "Signal Recieved Airspeed";
    c2++;

    m_airspeed.append(c2);                   // Appends the counter id
    m_airspeed.append(airspeed.airspeed);    // Appends the correspondent sensor value
    emit airspeedChanged(m_airspeed);        // Emit the data to the GS
    m_airspeed.clear();                      // Clear the memory used by th

}

void Back_End::setBarometer(mavlink_barometer_t barometer){
    qInfo() << "Signal Recieved Barometer";
    c3++;

    m_pressure.append(c3);                   // Appends the counter id
    m_pressure.append(barometer.pressure);   // Appends the correspondent sensor value
    emit pressureChanged(m_pressure);        // Emit the data to the GS
    m_pressure.clear();                      // Clear the memory used by th
}

void Back_End::setFlightangles(mavlink_flightangles_t flightangles){
    qInfo() << "Signal Recieved FlightAngles";
    c4++;

    m_tiltAngleL.append(c4);                   // Appends the counter id
    m_tiltAngleL.append(flightangles.ltilt);   // Appends the correspondent sensor value
    emit tiltAngleLChanged(m_tiltAngleL);      // Emit the data to the GS
    m_tiltAngleL.clear();                      // Clear the memory used by th

    m_tiltAngleR.append(c4);                   // Appends the counter id
    m_tiltAngleR.append(flightangles.rtilt);   // Appends the correspondent sensor value
    emit tiltAngleRChanged(m_tiltAngleR);      // Emit the data to the GS
    m_tiltAngleR.clear();                      // Clear the memory used by th

    m_angleofAttack.append(c4);                   // Appends the counter id
    m_angleofAttack.append(flightangles.attack);  // Appends the correspondent sensor value
    emit angleofAttackChanged(m_angleofAttack);   // Emit the data to the GS
    m_angleofAttack.clear();                      // Clear the memory used by th

    m_sideslip.append(c4);                     // Appends the counter id
    m_sideslip.append(flightangles.sideslip);  // Appends the correspondent sensor value
    emit sideslipChanged(m_sideslip);          // Emit the data to the GS
    m_sideslip.clear();                        // Clear the memory used by th
}

void Back_End::setFlightsurfaces(mavlink_flightsurfaces_t flightsurfaces){
    c5++;

    m_ruddervatorL.append(c5);                            // Appends the counter id
    m_ruddervatorL.append(flightsurfaces.lruddervator);   // Appends the correspondent sensor value
    emit ruddervatorLChanged(m_ruddervatorL);             // Emit the data to the GS
    m_ruddervatorL.clear();                               // Clear the memory used by th

    m_ruddervatorR.append(c5);                            // Appends the counter id
    m_ruddervatorR.append(flightsurfaces.rruddervator);   // Appends the correspondent sensor value
    emit ruddervatorRChanged(m_ruddervatorR);             // Emit the data to the GS
    m_ruddervatorR.clear();                               // Clear the memory used by th

    m_aileronL.append(c5);                        // Appends the counter id
    m_aileronL.append(flightsurfaces.laileron);   // Appends the correspondent sensor value
    emit aileronLChanged(m_aileronL);             // Emit the data to the GS
    m_aileronL.clear();                           // Clear the memory used by th

    m_aileronR.append(c5);                        // Appends the counter id
    m_aileronR.append(flightsurfaces.raileron);   // Appends the correspondent sensor value
    emit aileronRChanged(m_aileronR);             // Emit the data to the GS
    m_aileronR.clear();                           // Clear the memory used by th
}

void Back_End::setGPS(mavlink_gps_t gps){
    c6++;

    m_altitude.append(c6);                   // Appends the counter id
    m_altitude.append(gps.altitude);       // Appends the correspondent sensor value
    emit altitudeChanged(m_altitude);         // Emit the data to the GS
    m_altitude.clear();                      // Clear the memory used by th

    m_latitude.append(c6);                   // Appends the counter id
    m_latitude.append(gps.latitude);       // Appends the correspondent sensor value
    emit latitudeChanged(m_latitude);         // Emit the data to the GS
    m_latitude.clear();                      // Clear the memory used by th

    m_longitude.append(c6);                   // Appends the counter id
    m_longitude.append(gps.longitude);       // Appends the correspondent sensor value
    emit longitudeChanged(m_longitude);         // Emit the data to the GS
    m_longitude.clear();                      // Clear the memory used by th
}

void Back_End::setThrust(mavlink_thrust_t thrust){
    c7++;

    m_thrustL.append(c7);                   // Appends the counter id
    m_thrustL.append(thrust.lthrust);       // Appends the correspondent sensor value
    emit thrustLChanged(m_thrustL);         // Emit the data to the GS
    m_thrustL.clear();                      // Clear the memory used by th

    m_thrustR.append(c7);                   // Appends the counter id
    m_thrustR.append(thrust.rthrust);       // Appends the correspondent sensor value
    emit thrustRChanged(m_thrustR);         // Emit the data to the GS
    m_thrustR.clear();                      // Clear the memory used by th
}

/* /////////////////////////////////////////////////////// QML SLOTS /////////////////////////////////////////////////// */

void Back_End::getConnection(QString type, QString param_1, QString param_2, QString param_3, QString param_4, 
                                QString param_5, QString param_6, QString param_7, QString param_8){

    // Connection Type Selection Slot

    connection_type = type;
    m_param_1 = param_1;
    m_param_2 = param_2;
    m_param_2 = param_3;
    m_param_2 = param_4;
    m_param_2 = param_5;
    m_param_2 = param_6;
    m_param_2 = param_7;
    m_param_2 = param_8;
    //m_param_2 = param_9;

    qInfo() << "Signal Recieved - Type: " << connection_type << "First Param: " << m_param_1
            << "Second Param: " << m_param_2
            << "Thrid Param: " << m_param_3
            << "Fourth Param: " << m_param_4
            << "Fifth Param: " << m_param_5
            << "Sixth Param: " << m_param_6
            << "Seventh Param: " << m_param_7
            << "Eighth Param: " << m_param_8;
            //<< "Nineth Param: " << m_param_9;
}


