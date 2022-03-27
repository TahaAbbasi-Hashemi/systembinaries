#!/bin/bash
# Update alacritty config to apply the configured colors

file_read="$HOME/.config/i3/config_read"
file="$HOME/.config/i3/config"
cp $file_read $file_read".save"

#Updating Colors in Alacritty
text="#BLACK #RED #GREEN #YELLOW #BLUE #MAGENTA #CYAN #WHITE #LIGHT_BLACK #LIGHT_RED #LIGHT_GREEN #LIGHT_YELLOW #LIGHT_BLUE #LIGHT_MAGENTA #LIGHT_CYAN #LIGHT_WHITE"
colors="$BLACK $RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN $WHITE $LIGHT_BLACK $LIGHT_RED $LIGHT_GREEN $LIGHT_YELLOW $LIGHT_BLUE $LIGHT_MAGENTA $LIGHT_CYAN $LIGHT_WHITE"
for i in {1..16};do
    seler=$(echo $text | awk '{print $'$i'}')
    seter=$(echo $colors | awk '{print $'$i'}')
    sed -i 's/'$seler'/"'$seter'"/g' $file_read
done

rm $file
cp $file_read $file
rm $file_read
cp $file_read".save" $file_read

