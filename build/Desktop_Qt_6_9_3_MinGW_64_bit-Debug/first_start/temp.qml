import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    // <body class="bg-dark-900 text-gray-200 min-h-screen">
    // → The root window, representing the entire page.
    //   Tailwind "bg-dark-900" → dark background color
    //   "text-gray-200" → default text color (light gray)
    //   "min-h-screen" → fill entire window height
    visible: true
    width: 1280
    height: 800
    color: "#0f172a" // dark-900
    title: "Dashboard"

    ScrollView {
        anchors.fill: parent

        // <div class="container mx-auto px-4 py-6">
        // → Container: centers content, limits width, adds padding
        ColumnLayout {
            width: Math.min(parent.width, 1280) // container max-width
            anchors.horizontalCenter: parent.horizontalCenter // mx-auto
            padding: 24 // px-4 py-6
            spacing: 24

            // <header class="flex items-center justify-between mb-8">
            // → Horizontal flex layout, spaced apart
            RowLayout {
                Layout.fillWidth: true
                spacing: 16

                // <h1 class="text-2xl font-bold">Dashboard</h1>
                // → Large bold heading
                Label {
                    text: "Dashboard"
                    color: "#e5e7eb" // text-gray-200
                    font.pixelSize: 24
                    font.bold: true
                }

                // Spacer to push the button to the right
                Item { Layout.fillWidth: true }

                // <button class="bg-primary-500 text-white px-4 py-2 rounded">
                // → Primary button with rounded corners and padding
                Rectangle {
                    width: 100
                    height: 36
                    radius: 8
                    color: "#6366f1" // primary-500
                    Label {
                        anchors.centerIn: parent
                        text: "New Run"
                        color: "white"
                        font.bold: true
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("New Run clicked")
                    }
                }
            }

            // <div class="grid grid-cols-4 gap-6 mb-8">
            // → 4-column grid layout with gaps
            GridLayout {
                Layout.fillWidth: true
                columns: 4
                columnSpacing: 24
                rowSpacing: 24

                // <div class="bg-dark-800 p-6 rounded-lg text-center">
                // → Each card block
                Repeater {
                    model: [
                        { title: "Quality Score", value: "92%", color: "#4ade80" },
                        { title: "Total Runs", value: "48", color: "#6366f1" },
                        { title: "Failed Tests", value: "8", color: "#f87171" },
                        { title: "Test Coverage", value: "78%", color: "#facc15" }
                    ]

                    delegate: Rectangle {
                        radius: 12 // rounded-lg
                        color: "#1e293b" // bg-dark-800
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120
                        Column {
                            anchors.centerIn: parent
                            spacing: 6
                            Label {
                                text: modelData.title
                                color: "#e5e7eb"
                                font.pixelSize: 16
                                font.bold: true
                            }
                            Label {
                                text: modelData.value
                                color: modelData.color
                                font.pixelSize: 28
                                font.bold: true
                            }
                        }
                    }
                }
            }

            // <div class="bg-dark-800 rounded-lg p-6">
            Rectangle {
                Layout.fillWidth: true
                radius: 12
                color: "#1e293b" // bg-dark-800
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 12

                    // <h2 class="text-xl font-semibold mb-4">Recent Test Runs</h2>
                    Label {
                        text: "Recent Test Runs"
                        color: "#e5e7eb"
                        font.pixelSize: 20
                        font.bold: true
                    }

                    // <table class="min-w-full">
                    // → Table using QML TableView
                    TableView {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        model: ListModel {
                            ListElement { id_: "#TR-1024"; suite: "Smoke Tests"; status: "Passed"; date: "Today" }
                            ListElement { id_: "#TR-1023"; suite: "Regression Suite"; status: "Failed"; date: "Yesterday" }
                        }

                        TableViewColumn { role: "id_"; title: "Run ID"; width: 150 }
                        TableViewColumn { role: "suite"; title: "Suite"; width: 200 }
                        TableViewColumn { role: "status"; title: "Status"; width: 120 }
                        TableViewColumn { role: "date"; title: "Date"; width: 150 }

                        delegate: Rectangle {
                            height: 40
                            color: index % 2 === 0 ? "#334155" : "#1e293b"
                            RowLayout {
                                anchors.fill: parent
                                Label { text: id_; color: "#e5e7eb"; Layout.preferredWidth: 150 }
                                Label { text: suite; color: "#e5e7eb"; Layout.preferredWidth: 200 }
                                Label {
                                    text: status
                                    color: status === "Passed" ? "#4ade80" :
                                           status === "Failed" ? "#f87171" : "#e5e7eb"
                                    Layout.preferredWidth: 120
                                }
                                Label { text: date; color: "#94a3b8"; Layout.preferredWidth: 150 }
                            }
                        }
                    }
                }
            }
        }
    }
}
