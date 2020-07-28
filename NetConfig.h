#ifndef __NetConfig__
#define __NetConfig__

#include <QObject>
#include <QVariant>
#include <QNetworkConfigurationManager>

class NetConfig : public QObject
{
    Q_OBJECT

public:
    NetConfig(QObject* parent = nullptr);

    Q_INVOKABLE QVariant allConfigs() const;

protected:
    QNetworkConfigurationManager m_NetworkConfigurationManager;

};

#endif
