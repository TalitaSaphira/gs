#ifndef CONNECTION_H
#define CONNECTION_H

#include <QObject>
#include <QAbstractSocket>
#include <QUdpSocket>
#include "include/common/mavlink.h"
#include "include/custom/custom.h"

class Connection : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool connectionStatus READ isConnected NOTIFY statusChanged)
public:
    explicit Connection(QObject* parent = nullptr);

    virtual bool isConnected() const = 0;
    virtual void start() = 0;
    virtual void stop() = 0;

public slots:
    virtual void sendData(const QByteArray& data) = 0;

signals :
    void statusChanged(bool connectionStatus);
    void messageReceived(const QByteArray& data);

};

#endif // CONNECTION_H
