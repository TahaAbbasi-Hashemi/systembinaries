#!/bin/bash
# Update alacritty config to apply the configured colors

file="$HOME/.config/alacritty/alacritty.yml"
cp $file $file".save"

#Updating Colors in Alacritty
text="#BLACK #RED #GREEN #YELLOW #BLUE #MAGENTA #CYAN #WHITE"
colors="$BLACK $RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN $WHITE"
for i in {1..8};do
    seler=$(echo $text | awk '{print $'$i'}')
    seter=$(echo $colors | awk '{print $'$i'}')
    ori=$(grep $seler $file)
    new=$(echo $ori | awk '{print "    " $1 " \"'$seter'\" " $3}')
    sed -i "s/$ori/$new/g" $file
done

