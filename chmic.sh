#! /bin/sh
#Changes the audio of a preset mic system
#Increases or decreases by 5. Minimum of 10% and max of 95%
#Can mute or unmute audio as well.

mic=" PCM2902C Audio CODEC Analog Stereo"
source_site=$(wpctl status | grep " PCM2902C Audio CODEC Analog Stereo" | tail -n 1 | awk '{print $3}'| head -c 2)
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
    echo "please use chmic --help"
fi
if [ "$1" = "--help" ]; then
    echo "chspeak <command>"
    echo "<up> to increase volume"
    echo "<down> to decrease volume"
    echo "<mute> to mute"
    echo "<umute> to unmute"
    echo "<--help> for help" 
fi
