#include "debug_emulator.h"
#include <QString>

float Sensor::time_stamp = 0;

Sensor::Sensor(){}

Sensor::~Sensor(){}

void Sensor::add_sensorItem(std::string item_name, int variance, int center_value){

    // The sensor value is generated by a center value +/- a variance value

    sensor_readings[item_name] = center_value;
    variance_list.push_back(variance);
    qInfo() << "The item " << QString::fromStdString(item_name) <<" was added to the sensor " << QString::fromStdString(name);
}

void Sensor::update_reading(){

    // The itens of the sensor are listed in an dict of readings where the reading name is the key

    auto reading = sensor_readings.begin();
    int i = 0;
    while (reading != sensor_readings.end()){
        //qInfo() << i << QString::fromStdString(reading->first) << variance_list;
        (*reading).second = (*reading).second + variance_list[i]*sin(time_stamp);
        //qInfo() << "Reading: " << (*reading).second << "Variance: " << variance_list[i];
        reading++;
        i++;
        time_stamp = time_stamp + 0.01;
    }
}

std::map<std::string, qreal> Sensor::get_readings(){
    update_reading();
    return sensor_readings;
}

std::string Sensor::get_name(){
    return name;
}

UAV::UAV(){

    Sensor imu("ADIS IMU");                 // Creates a new sensor for the UAV emulator
    imu.add_sensorItem("Roll", 30, 0);      // Adds a new item to the sensor
    imu.add_sensorItem("Pitch", 180, 0);
    imu.add_sensorItem("Yaw", 360, 0);

    add_sensor(imu);                        // Adds it to the UAV

    Sensor airspeed("3DR Pixhawk Airspeed");
    airspeed.add_sensorItem("Airspeed", 50, 0);

    add_sensor(airspeed);

    Sensor gps("GPS");
    gps.add_sensorItem("Latitude", 1, -18);
    gps.add_sensorItem("Longitude", 1, -43);

    add_sensor(gps);

    //Mudar nome dos sensores
    Sensor barometer("Barômetro");
    barometer.add_sensorItem("Pressure", 10, 0);
}

void UAV::add_sensor(Sensor new_sensor){

    // Adds new Sensor to UAV
    sensor_list.push_back(new_sensor);
    qInfo() << "The item " << QString::fromStdString(new_sensor.get_name()) << " was added to the UAV";
    sensor_counter++;
}

void UAV::update_UAV(){

    // Generates new sensor values
    for (Sensor sensor : sensor_list){
        sensor.update_reading();
    log_msg = QString("Log Message - %1").arg(log_id);
    log_id++;
    }
}

std::string UAV::getLog_msg(){
    return log_msg.toStdString();
}

std::list<Sensor> UAV::get_sensorlist(){
    return sensor_list;
}

Debug_Emulator::Debug_Emulator(){}

void Debug_Emulator::run(){

    // Starts a thread that runs simultainaly with the main program and constantly updates the fake UAV states
    UAV uav;
    while (true){
        uav.update_UAV();
        emit uav_data(uav);
        msleep(100);
//        qInfo("Signal Emited");
    }
}
