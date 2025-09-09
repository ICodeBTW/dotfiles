import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    width: 800
    height: 600

    // Background Image without blur (remove if QtGraphicalEffects not available)
    Image {
        id: background
        anchors.fill: parent
        source: "/etc/sddm/wallpapers/wallpaper.jpeg"
        fillMode: Image.PreserveAspectCrop
        smooth: true
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(21/255, 18/255, 15/255, 0.6) // Dark transparent overlay
    }

    Column {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        spacing: 20
        width: 300

        // Time Label
        Text {
            id: timeLabel
            text: Qt.formatTime(new Date(), "H:mm")
            font.pixelSize: 115
            font.family: "Maple Mono Bold"
            color: Qt.rgba(235/255, 219/255, 178/255, 0.9)
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true
        }

        // Date Label
        Text {
            id: dateLabel
            text: Qt.formatDate(new Date(), "dddd, MMMM d")
            font.pixelSize: 18
            font.family: "Maple Mono"
            color: Qt.rgba(235/255, 219/255, 178/255, 0.9)
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true
        }

// Username Dropdown
ComboBox {
    id: userSelector
    model: userModel            // comes from SDDM
    textRole: "name"            // userModel provides "name" for each user
    font.family: "Maple Mono Bold"
    font.pixelSize: 15
    width: 300
    height: 40
    anchors.horizontalCenter: parent.horizontalCenter

    // Style
    background: Rectangle {
        radius: 10
        color: Qt.rgba(102/255, 92/255, 84/255, 0.33)
        border.color: "transparent"
    }
    contentItem: Text {
        text: userSelector.displayText
        font: userSelector.font
        color: Qt.rgba(235/255, 219/255, 178/255, 1)
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // Keep track of selected user
    onCurrentTextChanged: {
        sddm.login.user = currentText
    }
}

        // Password Input Field
        TextField {
            id: passwordField
            echoMode: TextInput.Password
            placeholderText: "Enter Password"
            font.family: "Maple Mono Bold"
            font.pixelSize: 14
            color: Qt.rgba(235/255, 219/255, 178/255, 0.9)
            background: Rectangle {
                radius: 10
                color: Qt.rgba(102/255, 92/255, 84/255, 0.33)
                border.color: "transparent"
                implicitWidth: 300
                implicitHeight: 50
            }
            padding: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 50
            cursorVisible: true
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.text = Qt.formatTime(new Date(), "H:mm")
            dateLabel.text = Qt.formatDate(new Date(), "dddd, MMMM d")
        }
    }
}
