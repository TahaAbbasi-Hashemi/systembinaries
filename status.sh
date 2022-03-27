#! /bin/bash

speak_source=$(wpctl status | grep "Built-in Audio Analog Stereo" | awk '{print $3}' | head -c 2)
mic_source=$(wpctl status | grep " PCM2902C Audio CODEC Analog Stereo" | tail -n 1 | awk '{print $3}'| head -c 2)
echo '{ "version": 1 }'
echo '['
echo '[]'
while :;
do
    #data
    data_mem=$(free -mh --si | grep "Mem" | awk '{print $3}')
    data_journal=$(date +"%Y-%j")
    data_time=$(date +"%F %a %r")
    data_speaker=$(wpctl status | grep $speak_source | tail -c 4 | head -c 2)
    data_mic=$(wpctl status | grep $mic_source | tail -c 4 | head -c 2)
    data_root=$(df -H | awk '/nvme0n1p2/{print $4" Free"}' | head -n 1)
    data_cpu=$(paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | awk '/x86/{print $2}' | sed 's/\(.\)..$/.\1 C/')

    #Format
    format_journal="{\"color\":\"$WHITE\", \"full_text\":\"$data_journal\"}"
    format_time="{\"color\":\"$LIGHT_WHITE\", \"full_text\":\"$data_time\"}"
    format_sound="{\"color\":\"$CYAN%\", \"full_text\":\"M-$data_mic S-$data_speaker\"}"
    format_cpu="{\"color\":\"$YELLOW%\", \"full_text\":\"CPU:$data_cpu\"}"
    format_mem="{\"color\":\"$YELLOW\", \"full_text\":\"$data_mem\"}"
    format_root="{\"color\":\"$YELLOW%\", \"full_text\":\"$data_root\"}"

    echo ",[$format_root, $format_mem, $format_cpu, $format_sound, $format_journal, $format_time]"
    sleep 0.250
done
