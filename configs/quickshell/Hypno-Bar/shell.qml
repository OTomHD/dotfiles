import Quickshell
import Quickshell.Wayland
import "Modules" as Modules
import QtQuick
import QtQuick.Layouts
import qs.config

PanelWindow{
  id: root

  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 30
  color: Theme.colBg
  screen: Quickshell.screens.find(s => s.name == "DP-2")

  RowLayout{
    anchors.fill: parent
    anchors.margins: 8
    spacing: 8

    // Left Items
    Modules.Workspaces_hyprland{}

    Item{ Layout.fillWidth: true}
    // Middle Items

    Item{ Layout.fillWidth: true}
    // Rights Items
    Modules.VolumeLevel{}
    Modules.Clock{}
    
  }

}


