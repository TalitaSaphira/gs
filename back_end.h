#ifndef BACK_END_H
#define BACK_END_H
#include "QObject"
#include "QtQml"
#include <QQmlPropertyValueSource>
#include "QSignalMapper"
#include "debug_emulator.h"
#include "map"
#include "QDebug"
#include "QDoubleSpinBox"
#include "QSignalMapper"
#include "QString"
#include "QList"
#include "QtCharts"
#include "chrono"
#include "mavsys.h"
#include "messagehandler.h"

using namespace std;

class Back_End : public QObject     // Class Constructor heirs from QObject
{   Q_OBJECT                        // Tag that makes QT recognize as an Object

public:
    Back_End(QObject *parent = nullptr);

    // Signals Emmited to the QML level
signals:
    void airspeedChanged(QList<qreal> value);
    void rollChanged(QList<qreal> value);
    void pitchChanged(QList<qreal> value);
    void headingChanged(QList<qreal> value);
    void altitudeChanged(QList<qreal> value);
    void pressureChanged(QList<qreal> value);
    void sideslipChanged(QList<qreal> value);
    void fVelocityChanged(QList<qreal> value);
    void lVelocityChanged(QList<qreal> value);
    void angleofAttackChanged(QList<qreal> value);
    void tiltAngleRChanged(QList<qreal> value);
    void tiltAngleLChanged(QList<qreal> value);
    void aileronLChanged(QList<qreal> value);
    void aileronRChanged(QList<qreal> value);
    void ruddervatorRChanged(QList<qreal> value);
    void ruddervatorLChanged(QList<qreal> value);
    void thrustRChanged(QList<qreal> value);
    void thrustLChanged(QList<qreal> value);
    void longitudeChanged(QList<qreal> value);
    void latitudeChanged(QList<qreal> value);
    //void gpsChanged(QList<qreal> value;

    void sensorChanged(QList<qreal> sensor_readings[9]);

    void newLogMsg(QString log_msg);


public slots:
    /*void setSensors(UAV uav_data);  // Front-end Debug Slot*/

    // Mavlink Slots
    void setAttitude(mavlink_attitude_t attitude);
    void setIMU(mavlink_hil_sensor_t imu);
    //void setStatustext(mavlink_statustext_t statustext);

    void setAirspeed(mavlink_airspeed_t airspeed);
    void setBarometer(mavlink_barometer_t barometer);
    void setFlightangles(mavlink_flightangles_t flightangles);
    void setFlightsurfaces(mavlink_flightsurfaces_t flightsurfaces);
    void setGPS(mavlink_gps_t gps);
    void setThrust(mavlink_thrust_t thrust);

    // QML level Slots
    void getConnection(QString type, QString param_1, QString param_2, QString param_3, QString param_4, 
                        QString param_5, QString param_6, QString param_7, QString param_8);

private:

    // Data id Counter
    int c = 0;
    int c1 = 0;
    int c2 = 0;
    int c3 = 0;
    int c4 = 0;
    int c5 = 0;
    int c6 = 0;
    int c7 = 0;
    //int c8 = 0;

    // Communication Variables
    QString connection_type;
    QString m_param_1;
    QString m_param_2;
    QString m_param_3;
    QString m_param_4;
    QString m_param_5;
    QString m_param_6;
    QString m_param_7;
    QString m_param_8;
    //QString m_param_9;

    // Mavlink Sensor Values

    /* This is structed as (id counter, sensor_value)*/
    QList<qreal> m_airspeed;
    QList<qreal> m_altitude;
    QList<qreal> m_pressure;
    QList<qreal> m_sideslip;
    QList<qreal> m_thrustL;
    QList<qreal> m_thrustR;
    QList<qreal> m_aileronL;
    QList<qreal> m_aileronR;
    QList<qreal> m_ruddervatorL;
    QList<qreal> m_ruddervatorR;
    QList<qreal> m_tiltAngleL;
    QList<qreal> m_tiltAngleR;
    QList<qreal> m_angleofAttack;
    QList<qreal> m_fVelocity;
    QList<qreal> m_lVelocity;
    QList<qreal> m_roll;
    QList<qreal> m_pitch;
    QList<qreal> m_heading;
    QList<qreal> m_latitude;
    QList<qreal> m_longitude;

};
#endif // BACK_END_H
