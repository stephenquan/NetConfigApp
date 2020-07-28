#include "NetConfig.h"
#include <QNetworkConfiguration>

//----------------------------------------------------------------------
//
//----------------------------------------------------------------------

NetConfig::NetConfig(QObject* parent) :
    QObject(parent)
{
}

//----------------------------------------------------------------------
//
//----------------------------------------------------------------------

QVariant NetConfig::allConfigs() const
{
    QVariantList list;
    foreach (QNetworkConfiguration config, m_NetworkConfigurationManager.allConfigurations())
    {
        QVariantMap item;
        item["name"] = config.name();
        item["state"] = static_cast<int>(config.state());
        list.append(item);
    }
    return list;
}

//----------------------------------------------------------------------
//
//----------------------------------------------------------------------

