import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import StephenQuan 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Network Configuration App")

    property string allConfigsText: ""

    Rectangle {
        color: "#e0ffe0"
    }

    Flickable {
        id: flickable

        anchors.fill: parent
        anchors.margins: 10

        contentWidth: columnLayout.width
        contentHeight: columnLayout.height
        clip: true

        ColumnLayout {
            id: columnLayout

            width: flickable.width

            Button {
                text: qsTr("All Configs")
                font.pointSize: 12

                onClicked: refreshAllConfigs()
            }

            TextEdit {
                Layout.fillWidth: true

                selectByMouse: true
                readOnly: true

                text: allConfigsText
                font.pointSize: 12
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
        }
    }

    NetConfig {
        id: netConfig
    }

    Component.onCompleted: refreshAllConfigs()

    function refreshAllConfigs() {
        allConfigsText = netConfig.allConfigs()
            .map( ({name, state}) => "%1 (%2)".arg(name).arg(state) )
            .sort()
            .join("\n");
    }
}
