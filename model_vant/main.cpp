#include <QCoreApplication>

#include <string>
#include <list>

#include "../udpconnection.h"
#include "../mavsys.h"
#include "uavmessagehandler.h"
#include "../debug_emulator.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    UAV* uav = new UAV();
    MavSys* mavsys = new MavSys(1, 0);
    new UavMessageHandler(MAV_TYPE_FIXED_WING, mavsys, uav);
    mavsys->setParent(&a);

    UdpConnection conn(14551, QString("127.0.0.1"), 14550);
    mavsys->addConnection(&conn, MAVLINK_COMM_0);
    conn.start();

    return a.exec();
}
