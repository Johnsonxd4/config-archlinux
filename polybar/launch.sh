#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
i=`polybar --list-monitors | wc -l`
if [ $i > 1 ]
then
	echo "Two monitors connected. Lauching second configuration"
	polybar main -c $HOME/.config/polybar/config.ini &
	polybar main -c $HOME/.config/polybar/config2.ini &
else
	echo "Only one monitor is connected."
	polybar main -c $HOME/.config/polybar/config.ini &
fi
