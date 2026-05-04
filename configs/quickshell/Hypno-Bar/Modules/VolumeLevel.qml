import Quickshell.Services.Pipewire
import Quickshell
import QtQuick.Layouts
import QtQuick


RowLayout{
  spacing: 0
Text{
  text: ""
  font: "Font Awesome 7 Free Solid"
  color:"White"
}
Text{

  PwObjectTracker{
    objects: [Pipewire.defaultAudioSink]
  }

  text: Math.round(Pipewire.defaultAudioSink.audio.volume * 100) + "%"
  color: "White"
}
}
