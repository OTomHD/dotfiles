#!/bin/bash

case "$1" in
	screen)
		grim - | wl-copy;;
	area)
		grim -g "$(slurp)" - | wl-copy;;
	*)
		echo "Usage: $0 {screen|area}";;
esac
