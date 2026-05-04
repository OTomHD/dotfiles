import Quickshell
import QtQuick
import qs.config
Text{
  id: root

  SystemClock{
    id: clock
    precision: SystemClock.Minutes
  }

  color: Theme.colFg
  text: Qt.formatDateTime(clock.date, "ddd MMM - HH:mm")
}
