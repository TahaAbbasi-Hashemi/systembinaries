#!/bin/bash
# Update kitty to use system colors

file="$HOME/.config/kitty/kitty.conf"
cp $file $file".save"

#COLORS
text="color0 color1 color2 color3 color4 color5 color6 color7 color8 color9 color10 color11 color12 color13 color14 color15 background foreground"
colors="$BLACK $RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN $WHITE $LIGHT_BLACK $LIGHT_RED $LIGHT_GREEN $LIGHT_YELLOW $LIGHT_BLUE $LIGHT_MAGENTA $LIGHT_CYAN $LIGHT_WHITE $BLACK $WHITE"
for i in {1..18};do
    seler=$(echo $text | awk '{print $"'$i' "}')
    seter=$(echo $colors | awk '{print $'$i'}')
    ori=$(grep -w $seler $file)
    new=$(echo $ori | awk '{print $1 " '$seter'"}')
    sed -i "s/$ori/$new/g" $file
done

