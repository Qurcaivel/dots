#!/usr/bin/env bash

CFG="$HOME/.config/bspwm/polybar/config.ini"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q main -c $CFG &
done
