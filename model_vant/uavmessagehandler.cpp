#include "uavmessagehandler.h"

UavMessageHandler::UavMessageHandler(uint8_t type, MavSys* mavsys, UAV* uav)
    : MessageHandler(type, mavsys)
{
    _mavsys = mavsys;
    _type = type;
    _uav = uav;

    this->startTimer(1000);
    connect(mavsys, &MavSys::messageParsed,
            this, &UavMessageHandler::processMessage);
}


void UavMessageHandler::timerEvent(QTimerEvent* event)
{
    Q_UNUSED(event)

    mavlink_message_t message;
    mavlink_heartbeat_t heartbeat;
    heartbeat.type = _type;
    mavlink_msg_heartbeat_encode(_mavsys->getSysId(),
                                 _mavsys->getCompId(),
                                 &message, &heartbeat);
    _mavsys->sendMessageToAll(message);

    //--------------------------------------------------
    mavlink_attitude_t attitude;

    attitude.pitch = (-45 + qrand() % (90));
    attitude.yaw = (-180 + qrand() % (360));
    attitude.roll = (-45 + qrand() % (90));

    mavlink_msg_attitude_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                &message, &attitude);
    _mavsys->sendMessageToAll(message);

    qDebug() << "generate pitch:" << attitude.pitch;
    qDebug() << "generate yaw:" << attitude.yaw;
    qDebug() << "generate roll:" << attitude.roll;

    //qDebug() << "attitude sys ID: " << _mavsys->getSysId();
    //qDebug() << "attitude comp ID: " << _mavsys->getSysId();

    //--------------------------------------------------
    mavlink_hil_sensor_t imu;

    imu.xacc = (-10 + qrand() % (20));
    imu.yacc = (-10 + qrand() % (20));
    // imu.zacc = (-10 + qrand() % 20);

    // imu.xgyro = (-450 + qrand() % 450);
    // imu.ygyro = (-450 + qrand() % 450);
    // imu.zgyro = (-450 + qrand() % 450);

    // imu.xmag = (-3 + qrand() % 3);
    // imu.ymag = (-3 + qrand() % 3);
    // imu.zmag = (-3 + qrand() % 3);

    // imu.pressure_alt = (300 + qrand() % 800);

    mavlink_msg_hil_sensor_encode(_mavsys->getSysId(),
                                  _mavsys->getCompId(),
                                  &message, &imu);
    _mavsys->sendMessageToAll(message);

    qDebug() << "generate xacc:" << imu.xacc;
    qDebug() << "generate yacc:" << imu.yacc;

    //qDebug() << "imu ID: " << _mavsys->getSysId();
    //qDebug() << "imu comp ID: " << _mavsys->getSysId();

    //--------------------------------------------------
    //mavlink_statustext_t statustext;


    //--------------------------------------------------
    mavlink_airspeed_t airspeed;
    
    airspeed.airspeed = (-15 + qrand() % (45));

    mavlink_msg_airspeed_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                &message, &airspeed);
    _mavsys->sendMessageToAll(message);

    qDebug() << "generate airspeed:" << airspeed.airspeed;

    //qDebug() << "airspeed ID: " << _mavsys->getSysId();
    //qDebug() << "airspeed comp ID: " << _mavsys->getSysId();

    //--------------------------------------------------
    mavlink_barometer_t barometer;

    barometer.pressure = (-45 + qrand() % (450));

    mavlink_msg_barometer_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                &message, &barometer);
    _mavsys->sendMessageToAll(message);

    qDebug() << "generate barometer:" << barometer.pressure;

    //--------------------------------------------------
    mavlink_flightangles_t flightangles;
    
    flightangles.ltilt = (-450 + qrand() % (450));
    flightangles.rtilt = (-450 + qrand() % (450));
    flightangles.sideslip = (-450 + qrand() % (450));
    flightangles.attack = (-450 + qrand() % (450));

    mavlink_msg_flightangles_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                 &message, &flightangles);
    _mavsys->sendMessageToAll(message);

     qDebug() << "generate ltilt:" << flightangles.ltilt;
     qDebug() << "generate rtilt:" << flightangles.rtilt;
     qDebug() << "generate sideslip:" << flightangles.sideslip;
     qDebug() << "generate attack:" << flightangles.attack;

    //--------------------------------------------------
    mavlink_flightsurfaces_t flightsurfaces;

    flightsurfaces.laileron = (-45 + qrand() % (90));
    flightsurfaces.raileron = (-45 + qrand() % (90));
    flightsurfaces.lruddervator = (-45 + qrand() % (90));
    flightsurfaces.rruddervator = (-45 + qrand() % (90));

    mavlink_msg_flightsurfaces_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                 &message, &flightsurfaces);
    _mavsys->sendMessageToAll(message);

    //--------------------------------------------------
    mavlink_gps_t gps;

    //gps.latitude = (-45 + qrand() % (90));
    //gps.longitude = (-45 + qrand() % (90));
    gps.altitude = (-45 + qrand() % (90));

    mavlink_msg_gps_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                 &message, &gps);
    _mavsys->sendMessageToAll(message);

    //--------------------------------------------------
    mavlink_thrust_t thrust;

    thrust.lthrust = (-45 + qrand() % (90));
    thrust.rthrust = (-45 + qrand() % (90));

    mavlink_msg_thrust_encode(_mavsys->getSysId(),
                                _mavsys->getCompId(),
                                 &message, &thrust);
    _mavsys->sendMessageToAll(message);

}

