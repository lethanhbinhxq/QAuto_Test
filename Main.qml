import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

Window {
  id: root
  visible: true
  width: 1280
  height: 720
  title: "QA Automation Tool | Test Runs"
  color: tailwind.colors.dark900

  FontLoader {
    id: fa
    source: "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/webfonts/fa-solid-900.ttf"
  }

  property var tailwind: ({
                            "colors": {
                              "gray200": "#e5e7eb",
                              "gray400": "#99a1af",
                              "green500": "#00c951",
                              "red500": "#fb2c36",
                              "blue500": "#2b7fff",
                              "yellow500": "#efb100",
                              "dark900": "#0f172a",
                              "dark800": "#1e293b",
                              "dark700": "#334155",
                              "dark600": "#475569",
                              "primary500": "#6366f1",
                              "primary600": "#4f46e5"
                            },
                            "baseSpace": 4,
                            "space": function (n) {
                              return n * this.baseSpace
                            },
                            "fontSize": {
                              "xs": 12,
                              "sm": 14,
                              "base": 16,
                              "lg": 18,
                              "xl": 20,
                              "xl2": 24,
                              "xl3": 30,
                              "xl4": 36,
                              "xl5": 48,
                              "xl6": 60,
                              "xl7": 72,
                              "xl8": 96,
                              "xl9": 128
                            },
                            "withOpacity": function (color, alpha) {
                              const base = Qt.colorEqual(
                                           color,
                                           "transparent") ? Qt.rgba(
                                                              0, 0, 0,
                                                              0) : Qt.colorEqual(
                                                              color, color)
                              const c = Qt.color(color)
                              return Qt.rgba(c.r, c.g, c.b, alpha)
                            }
                          })

  ScrollView {
    anchors.fill: parent

    Item {
      id: contentWrapper
      width: parent.width
      anchors.margins: tailwind.space(6)
      implicitHeight: mainLayout.implicitHeight

      ColumnLayout {
        id: mainLayout
        width: parent.width - tailwind.space(24)
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: tailwind.space(8)

        MouseArea {
          anchors.fill: parent
          acceptedButtons: Qt.LeftButton
          onClicked: {
            if (!searchField.contains(mapToItem(searchField, mouse.x,
                                                mouse.y))) {
              searchField.focus = false
            }
          }
        }

        // Header
        RowLayout {
          id: header
          Layout.fillWidth: true
          Layout.alignment: Qt.AlignVCenter
          spacing: tailwind.space(4)

          RowLayout {
            spacing: tailwind.space(4)
            Layout.alignment: Qt.AlignVCenter

            Text {
              text: "\uf544"
              font.family: fa.name
              font.pixelSize: tailwind.fontSize.xl3
              color: tailwind.colors.primary500
              verticalAlignment: Text.AlignVCenter
            }

            Text {
              text: "QAuto"
              color: tailwind.colors.gray200
              font.pixelSize: tailwind.fontSize.xl2
              font.bold: true
              verticalAlignment: Text.AlignVCenter
            }
          }

          Item {
            Layout.fillWidth: true
          }

          RowLayout {
            spacing: tailwind.space(8)
            Layout.alignment: Qt.AlignVCenter

            Item {
              id: bellWrapper
              width: bellButton.width
              height: bellButton.height

              Rectangle {
                id: bellButton
                color: bellMouseArea.containsMouse ? tailwind.colors.dark700 : "transparent"
                width: bellIcon.implicitWidth + tailwind.space(4)
                height: bellIcon.implicitHeight + tailwind.space(4)
                radius: width / 2
                anchors.centerIn: parent

                Behavior on color {
                  ColorAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                  }
                }

                Text {
                  id: bellIcon
                  text: "\uf0f3"
                  font.family: fa.name
                  font.pixelSize: tailwind.fontSize.xl
                  color: tailwind.colors.gray200
                  anchors.centerIn: parent
                }
              }

              Rectangle {
                color: tailwind.colors.red500
                width: tailwind.space(2)
                height: tailwind.space(2)
                radius: width / 2
                anchors.top: bellButton.top
                anchors.right: bellButton.right
              }

              MouseArea {
                id: bellMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
              }
            }

            RowLayout {
              spacing: tailwind.space(2)
              Layout.alignment: Qt.AlignVCenter

              Rectangle {
                width: tailwind.space(10)
                height: tailwind.space(10)
                radius: width / 2
                color: tailwind.colors.primary500

                Text {
                  text: "JD"
                  color: tailwind.colors.gray200
                  anchors.centerIn: parent
                  font.weight: Font.DemiBold
                  font.pixelSize: tailwind.fontSize.base
                }
              }

              Text {
                text: "John Doe"
                color: tailwind.colors.gray200
                font.pixelSize: tailwind.fontSize.base
                verticalAlignment: Text.AlignVCenter
              }
            }
          }
        }

        // Project Header
        Rectangle {
          id: projectHeader
          color: tailwind.colors.dark800
          radius: tailwind.space(4)
          width: parent.width
          implicitHeight: projectHeaderContent.implicitHeight + tailwind.space(
                            12)
          anchors.horizontalCenter: parent.horizontalCenter
          Layout.bottomMargin: tailwind.space(12)

          ColumnLayout {
            id: projectHeaderContent
            anchors.fill: parent
            anchors.margins: tailwind.space(6)
            spacing: tailwind.space(4)

            RowLayout {
              Layout.fillWidth: true
              Layout.alignment: Qt.AlignVCenter
              spacing: tailwind.space(8)

              ColumnLayout {
                spacing: tailwind.space(1)

                Text {
                  text: "E-Commerce Platform"
                  color: tailwind.colors.gray200
                  font.pixelSize: tailwind.fontSize.xl
                  font.bold: true
                }

                Text {
                  text: "Last updated: 2 hours ago"
                  color: tailwind.colors.gray400
                  font.pixelSize: tailwind.fontSize.base
                }
              }

              Item {
                Layout.fillWidth: true
              }

              RowLayout {
                spacing: tailwind.space(3)
                Layout.alignment: Qt.AlignVCenter

                Rectangle {
                  id: newTestButton
                  color: newTestMouse.containsMouse ? tailwind.colors.primary600 : tailwind.colors.primary500
                  radius: tailwind.space(2)
                  implicitWidth: newTestText.implicitWidth
                                 + newTestIcon.implicitWidth + 2 * tailwind.space(
                                   4)
                  implicitHeight: newTestText.implicitHeight + 2 * tailwind.space(
                                    2)

                  Behavior on color {
                    ColorAnimation {
                      duration: 150
                      easing.type: Easing.InOutQuad
                    }
                  }

                  RowLayout {
                    anchors.centerIn: parent
                    spacing: tailwind.space(2)

                    Text {
                      id: newTestIcon
                      text: "\uf067"
                      font.family: fa.name
                      color: tailwind.colors.gray200
                      font.pixelSize: tailwind.fontSize.base
                    }

                    Text {
                      id: newTestText
                      text: "New Test Run"
                      color: tailwind.colors.gray200
                      font.pixelSize: tailwind.fontSize.base
                      font.weight: Font.DemiBold
                    }
                  }

                  MouseArea {
                    id: newTestMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                  }
                }

                Rectangle {
                  id: settingButton
                  color: settingMouse.containsMouse ? tailwind.colors.dark600 : tailwind.colors.dark700
                  radius: tailwind.space(2)
                  implicitWidth: settingText.implicitWidth
                                 + settingIcon.implicitWidth + 2 * tailwind.space(
                                   4)
                  implicitHeight: settingText.implicitHeight + 2 * tailwind.space(
                                    2)

                  Behavior on color {
                    ColorAnimation {
                      duration: 150
                      easing.type: Easing.InOutQuad
                    }
                  }

                  RowLayout {
                    anchors.centerIn: parent
                    spacing: tailwind.space(2)

                    Text {
                      id: settingIcon
                      text: "\uf013"
                      font.family: fa.name
                      color: tailwind.colors.gray200
                      font.pixelSize: tailwind.fontSize.base
                    }

                    Text {
                      id: settingText
                      text: "Settings"
                      color: tailwind.colors.gray200
                      font.pixelSize: tailwind.fontSize.base
                      font.weight: Font.DemiBold
                    }
                  }

                  MouseArea {
                    id: settingMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                  }
                }
              }
            }
          }
        }

        // Navigation Tabs
        Item {
          width: parent.width
          anchors.horizontalCenter: parent.horizontalCenter

          Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: tailwind.colors.dark700
          }

          Row {
            id: navTabs
            spacing: tailwind.space(3)
            anchors.bottom: parent.bottom

            property var tabs: [{
                "icon": "\uf015",
                "text": "Dashboard",
                "active": false
              }, {
                "icon": "\uf03a",
                "text": "Test Cases",
                "active": false
              }, {
                "icon": "\uf04b",
                "text": "Test Runs",
                "active": true
              }, {
                "icon": "\uf188",
                "text": "Bugs",
                "active": false
              }, {
                "icon": "\uf0c0",
                "text": "Team",
                "active": false
              }]

            Repeater {
              model: navTabs.tabs

              delegate: Item {
                id: navButton
                implicitWidth: navContent.implicitWidth + 2 * tailwind.space(4)
                implicitHeight: navContent.implicitHeight + 2 * tailwind.space(
                                  3)

                Row {
                  id: navContent
                  anchors.centerIn: parent
                  spacing: tailwind.space(2)

                  Text {
                    text: modelData.icon
                    font.family: fa.name
                    font.weight: Font.Medium
                    font.pixelSize: tailwind.fontSize.base
                    color: navMouse.containsMouse
                           || modelData.active ? "white" : tailwind.colors.gray400

                    Behavior on color {
                      ColorAnimation {
                        duration: 150
                        easing.type: Easing.InOutQuad
                      }
                    }
                  }

                  Text {
                    text: modelData.text
                    font.weight: Font.Medium
                    font.pixelSize: tailwind.fontSize.base
                    color: navMouse.containsMouse
                           || modelData.active ? "white" : tailwind.colors.gray400

                    Behavior on color {
                      ColorAnimation {
                        duration: 150
                        easing.type: Easing.InOutQuad
                      }
                    }
                  }
                }

                Rectangle {
                  anchors.left: parent.left
                  anchors.right: parent.right
                  anchors.bottom: parent.bottom
                  height: 2
                  color: modelData.active ? tailwind.colors.primary500 : "transparent"
                }

                MouseArea {
                  id: navMouse
                  anchors.fill: parent
                  hoverEnabled: true
                  cursorShape: Qt.PointingHandCursor
                }
              }
            }
          }
        }

        // Quality Overview
        GridLayout {
          id: qualityGrid
          width: parent.width
          rowSpacing: tailwind.space(6)
          columnSpacing: tailwind.space(6)
          columns: parent.width > 800 ? 4 : 1
          flow: GridLayout.LeftToRight

          property real maxCardHeight: Math.max(
                                         qualityScoreContent.implicitHeight,
                                         totalRunContent.implicitHeight,
                                         failedTestContent.implicitHeight,
                                         coverageContent.implicitHeight)

          // Quality Score Card
          Rectangle {
            id: qualityScoreCard
            color: tailwind.colors.dark800
            radius: tailwind.space(4)
            Layout.fillWidth: true
            height: qualityGrid.maxCardHeight + 2 * tailwind.space(6)

            ColumnLayout {
              id: qualityScoreContent
              anchors.fill: parent
              anchors.margins: tailwind.space(6)
              Layout.alignment: Qt.AlignVCenter
              spacing: tailwind.space(4)

              RowLayout {
                ColumnLayout {
                  spacing: tailwind.space(1)
                  Text {
                    text: "Quality Score"
                    color: tailwind.colors.gray400
                    font.pixelSize: tailwind.fontSize.base
                  }

                  Text {
                    text: "92%"
                    color: tailwind.colors.gray200
                    font.pixelSize: tailwind.fontSize.xl3
                    font.bold: true
                  }
                }

                Item {
                  Layout.fillWidth: true
                }

                Rectangle {
                  width: tailwind.space(12)
                  height: tailwind.space(12)
                  radius: width / 2
                  color: tailwind.withOpacity(tailwind.colors.green500, 0.1)

                  Text {
                    text: "\uf00c"
                    font.family: fa.name
                    font.pixelSize: tailwind.fontSize.base
                    color: tailwind.colors.green500
                    anchors.centerIn: parent
                  }
                }
              }

              Rectangle {
                color: tailwind.colors.dark700
                radius: tailwind.space(1)
                height: tailwind.space(2)
                Layout.fillWidth: true
                clip: true
                Layout.bottomMargin: tailwind.space(3)

                Rectangle {
                  color: tailwind.colors.green500
                  radius: tailwind.space(1)
                  height: parent.height
                  width: parent.width * 0.92
                }
              }
            }
          }

          // Total Runs Card
          Rectangle {
            id: totalRunCard
            color: tailwind.colors.dark800
            radius: tailwind.space(4)
            Layout.fillWidth: true
            height: qualityGrid.maxCardHeight + 2 * tailwind.space(6)

            ColumnLayout {
              id: totalRunContent
              anchors.fill: parent
              anchors.margins: tailwind.space(6)
              Layout.alignment: Qt.AlignVCenter
              spacing: tailwind.space(4)

              RowLayout {
                ColumnLayout {
                  spacing: tailwind.space(1)
                  Text {
                    text: "Total Runs"
                    color: tailwind.colors.gray400
                    font.pixelSize: tailwind.fontSize.base
                  }

                  Text {
                    text: "48"
                    color: tailwind.colors.gray200
                    font.pixelSize: tailwind.fontSize.xl3
                    font.bold: true
                  }
                }

                Item {
                  Layout.fillWidth: true
                }

                Rectangle {
                  width: tailwind.space(12)
                  height: tailwind.space(12)
                  radius: width / 2
                  color: tailwind.withOpacity(tailwind.colors.blue500, 0.1)

                  Text {
                    text: "\uf201"
                    font.family: fa.name
                    font.pixelSize: tailwind.fontSize.base
                    color: tailwind.colors.blue500
                    anchors.centerIn: parent
                  }
                }
              }

              RowLayout {
                spacing: tailwind.space(1)
                Layout.alignment: Qt.AlignVCenter

                Text {
                  text: "\uf062"
                  font.family: fa.name
                  font.pixelSize: tailwind.fontSize.sm
                  color: tailwind.colors.green500
                }

                Text {
                  text: "12% from last week"
                  font.pixelSize: tailwind.fontSize.sm
                  color: tailwind.colors.green500
                }
              }
            }
          }

          // Failed Tests Card
          Rectangle {
            id: failedTestCard
            color: tailwind.colors.dark800
            radius: tailwind.space(4)
            Layout.fillWidth: true
            height: qualityGrid.maxCardHeight + 2 * tailwind.space(6)

            ColumnLayout {
              id: failedTestContent
              anchors.fill: parent
              anchors.margins: tailwind.space(6)
              Layout.alignment: Qt.AlignVCenter
              spacing: tailwind.space(4)

              RowLayout {
                ColumnLayout {
                  spacing: tailwind.space(1)
                  Text {
                    text: "Failed Tests"
                    color: tailwind.colors.gray400
                    font.pixelSize: tailwind.fontSize.base
                  }

                  Text {
                    text: "8"
                    color: tailwind.colors.gray200
                    font.pixelSize: tailwind.fontSize.xl3
                    font.bold: true
                  }
                }

                Item {
                  Layout.fillWidth: true
                }

                Rectangle {
                  width: tailwind.space(12)
                  height: tailwind.space(12)
                  radius: width / 2
                  color: tailwind.withOpacity(tailwind.colors.red500, 0.1)

                  Text {
                    text: "\uf00d"
                    font.family: fa.name
                    font.pixelSize: tailwind.fontSize.base
                    color: tailwind.colors.red500
                    anchors.centerIn: parent
                  }
                }
              }

              RowLayout {
                spacing: tailwind.space(1)
                Layout.alignment: Qt.AlignVCenter

                Text {
                  text: "\uf062"
                  font.family: fa.name
                  font.pixelSize: tailwind.fontSize.sm
                  color: tailwind.colors.red500
                }

                Text {
                  text: "2 new failures"
                  font.pixelSize: tailwind.fontSize.sm
                  color: tailwind.colors.red500
                }
              }
            }
          }

          // Coverage Card
          Rectangle {
            id: coverageCard
            color: tailwind.colors.dark800
            radius: tailwind.space(4)
            Layout.fillWidth: true
            height: qualityGrid.maxCardHeight + 2 * tailwind.space(6)

            ColumnLayout {
              id: coverageContent
              anchors.fill: parent
              anchors.margins: tailwind.space(6)
              Layout.alignment: Qt.AlignVCenter
              spacing: tailwind.space(4)

              RowLayout {
                ColumnLayout {
                  spacing: tailwind.space(1)
                  Text {
                    text: "Test Coverage"
                    color: tailwind.colors.gray400
                    font.pixelSize: tailwind.fontSize.base
                  }

                  Text {
                    text: "78%"
                    color: tailwind.colors.gray200
                    font.pixelSize: tailwind.fontSize.xl3
                    font.bold: true
                  }
                }

                Item {
                  Layout.fillWidth: true
                }

                Rectangle {
                  width: tailwind.space(12)
                  height: tailwind.space(12)
                  radius: width / 2
                  color: tailwind.withOpacity(tailwind.colors.yellow500, 0.1)

                  Text {
                    text: "\uf3ed"
                    font.family: fa.name
                    font.pixelSize: tailwind.fontSize.base
                    color: tailwind.colors.yellow500
                    anchors.centerIn: parent
                  }
                }
              }

              Rectangle {
                color: tailwind.colors.dark700
                radius: tailwind.space(1)
                height: tailwind.space(2)
                Layout.fillWidth: true
                clip: true
                Layout.bottomMargin: tailwind.space(3)

                Rectangle {
                  color: tailwind.colors.yellow500
                  radius: tailwind.space(1)
                  height: parent.height
                  width: parent.width * 0.78
                }
              }
            }
          }
        }

        // Test Runs Section
        Rectangle {
          color: tailwind.colors.dark800
          radius: tailwind.space(4)
          width: parent.width
          implicitHeight: testRunContent.implicitHeight
          anchors.horizontalCenter: parent.horizontalCenter
          Layout.bottomMargin: tailwind.space(6)
          clip: true

          ColumnLayout {
            id: testRunContent
            anchors.fill: parent

            RowLayout {
              Layout.fillWidth: true
              Layout.margins: tailwind.space(6)

              Text {
                text: "Recent Test Runs"
                color: tailwind.colors.gray200
                font.pixelSize: tailwind.fontSize.lg
                font.weight: Font.DemiBold
              }

              Item {
                Layout.fillWidth: true
              }

              RowLayout {
                spacing: tailwind.space(3)

                Item {
                  implicitWidth: parent.implicitWidth * 0.84
                  implicitHeight: searchBox.implicitHeight

                  Rectangle {
                    id: searchBox
                    anchors.fill: parent
                    color: tailwind.colors.dark700
                    border.color: searchField.activeFocus ? tailwind.colors.primary500 : tailwind.colors.dark600
                    border.width: searchField.activeFocus ? 2 : 1
                    radius: tailwind.space(2)
                    implicitHeight: searchField.implicitHeight + 2 * tailwind.space(
                                      2)

                    Text {
                      id: searchIcon
                      text: "\uf002"
                      font.family: fa.name
                      color: tailwind.colors.gray400
                      font.pixelSize: tailwind.fontSize.base
                      anchors.left: parent.left
                      anchors.leftMargin: tailwind.space(3)
                      anchors.top: parent.top
                      anchors.topMargin: tailwind.space(3)
                    }

                    TextField {
                      id: searchField
                      placeholderText: "Search runs..."
                      placeholderTextColor: tailwind.colors.gray400
                      color: tailwind.colors.gray200
                      background: null
                      font.pixelSize: tailwind.fontSize.base
                      anchors.left: parent.left
                      anchors.leftMargin: tailwind.space(8)
                      anchors.right: parent.right
                      anchors.rightMargin: tailwind.space(4)
                      anchors.verticalCenter: parent.verticalCenter
                    }
                  }
                }

                Rectangle {
                  color: filterMouse.containsMouse ? tailwind.colors.dark600 : tailwind.colors.dark700
                  radius: tailwind.space(2)
                  implicitWidth: filterIcon.implicitWidth + 2 * tailwind.space(
                                   3)
                  implicitHeight: searchBox.implicitHeight

                  Behavior on color {
                    ColorAnimation {
                      duration: 150
                      easing.type: Easing.InOutQuad
                    }
                  }

                  Text {
                    id: filterIcon
                    text: "\uf0b0"
                    font.family: fa.name
                    color: tailwind.colors.gray200
                    font.pixelSize: tailwind.fontSize.base
                    anchors.centerIn: parent
                  }

                  MouseArea {
                    id: filterMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                  }
                }
              }
            }

            Rectangle {
              Layout.fillWidth: true
              height: 1
              color: tailwind.colors.dark700
            }

            Text {
              text: "Hello"
              color: "white"
            }

            // Test Runs Table
            ColumnLayout {
              Layout.fillWidth: true
              spacing: 2

              // Test Runs Header
              Rectangle {
                color: tailwind.colors.dark700
                Layout.fillWidth: true
                implicitHeight: testRunHeaderRow.implicitHeight + 2 * tailwind.space(
                                  3)

                RowLayout {
                  id: testRunHeaderRow
                  anchors.fill: parent
                  anchors.leftMargin: tailwind.space(6)
                  anchors.rightMargin: tailwind.space(6)
                  anchors.left: parent.left
                  anchors.right: parent.right
                  spacing: tailwind.space(6)

                  Repeater {
                    model: ["Run ID", "Test Suite", "Environment", "Status", "Duration", "Date", "Actions"]

                    delegate: Text {
                      text: modelData
                      color: tailwind.colors.gray400
                      font.pixelSize: tailwind.fontSize.base
                      font.weight: Font.Medium
                      verticalAlignment: Text.AlignVCenter
                      Layout.fillWidth: true
                      elide: Text.ElideRight
                    }
                  }
                }
              }

              // // Table
              // TableView {
              //   id: tableView
              //   Layout.fillWidth: true
              //   implicitHeight: contentHeight
              //   clip: true
              //   columnSpacing: 1
              //   rowSpacing: 1

              //   model: TableModel {
              //     TableModelColumn {
              //       display: "name"
              //     }
              //     TableModelColumn {
              //       display: "color"
              //     }

              //     rows: [{
              //         "name": "cat",
              //         "color": "black"
              //       }, {
              //         "name": "dog",
              //         "color": "brown"
              //       }, {
              //         "name": "bird",
              //         "color": "white"
              //       }]
              //   }

              //   delegate: Rectangle {
              //     implicitHeight: 40
              //     implicitWidth: 100
              //     border.width: 1
              //     border.color: tailwind.colors.dark700
              //     color: tailwind.colors.dark800

              //     Text {
              //       text: display
              //       anchors.centerIn: parent
              //       color: tailwind.colors.gray200
              //     }
              //   }
              // }
            }
          }
        }
      }
    }
  }
}
