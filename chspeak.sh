#! /bin/sh
#Changes the audio of a preset speaker system.
#Increases or decreases by 5. Minimum of 10% and max of 95%
#Can mute or unmute audio as well.

speaker="Built-in Audio Analog Stereo"
source_site=$(wpctl status | grep "$speaker" | awk '{print $3}' | head -c 2)
level=$(wpctl status | grep $source_site | tail -c 4 | head -c 2)
if [ "$1" = "up" ]; then
    wpctl set-volume $source_site 0.$(expr $level + 5)
fi
if [ "$1" = "down" ]; then
    wpctl set-volume $source_site 0.$(expr $level - 5)
fi
if [ "$1" = "mute" ]; then
    wpctl set-mute $source_site 1
fi
if [ "$1" = "umute" ]; then
    wpctl set-mute $source_site 0
fi
if [ "$1" = "-h" ]; then 
    echo "please use chspeak --help"
fi
if [ "$1" = "--help" ]; then
    echo "chspeak <command>"
    echo "<up> to increase volume"
    echo "<down> to decrease volume"
    echo "<mute> to mute all audio"
    echo "<umute> to unmute all audio"
    echo "<--help> for help" 
fi
