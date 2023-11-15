#ifndef UAVMESSAGEHANDLER_H
#define UAVMESSAGEHANDLER_H

#include "../messagehandler.h"
#include "../debug_emulator.h"
#include <QObject>

class UavMessageHandler : public MessageHandler
{
    Q_OBJECT
public:
    UavMessageHandler(uint8_t type, MavSys* mavsys, UAV* uav);

private:
    void timerEvent(QTimerEvent *event) override;
    MavSys*  _mavsys;
    UAV* _uav;
    uint8_t _type;
};

#endif // UAVMESSAGEHANDLER_H
