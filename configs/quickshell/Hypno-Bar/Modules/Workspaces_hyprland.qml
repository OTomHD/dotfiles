import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.config

Repeater{
  model: 10
  Text{
    property int modIndex: index + 1
    property var workspace: Hyprland.workspaces.values.find(ws => ws.id === modIndex)
    property bool isFocused: Hyprland.focusedWorkspace?.id === (modIndex)

    text: index + 1
    color: isFocused ? Theme.colCyan: (workspace ? Theme.colBlue : Theme.colMuted)
    font {
      family: Theme.fontFamily
      pixelSize: Theme.fontSize
      bold: true
    }
    MouseArea{
      anchors.fill: parent
      onClicked: Hyprland.dispatch("workspace "+ (modIndex))
    }
  }
}

