#!/bin/sh
# Update kitty to use system colors

file="$HOME/.config/zathura/zathurarc"
cp $file $file".save"

#COLORS
text="recolor-darkcolor recolor-lightcolor notification-bg notification-fg highlight-color notification-warning-bg notification-error-bg statusbar-bg statusbar-fg default-bg default-fg"
colors="$LIGHT_WHITE $BLACK $BLACK $LIGHT_CYAN $YELLOW $YELLOW $RED $BLACK $CYAN #1A202A $WHITE"
for i in {1..11};do
    seler=$(echo $text | awk '{print $"'$i' "}')
    seter=$(echo $colors | awk '{print $'$i'}')
    ori=$(grep -w $seler $file)
    new=$(echo $ori | awk '{print $1" "$2 " \"'$seter'\""}')
    sed -i "s/$ori/$new/g" $file
done

