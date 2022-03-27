#! /bin/sh
pE=$(pacman -Qeq | wc -l)
pD=$(pacman -Qdq | wc -l)
win="i3"
font="Iosevka"
theme="Custom"
#win=$(wmctrl wmctrl -m | awk '/Name/{print $2}')
mem=$(free -mh | awk '/Mem/{print $3"/"$2}')
#storage=$(du -hc -d 0 /usr | awk '/total/{print $1}');
#tot=$(free -mh | grep "Mem" | awk '{print $2}')
#swap=$(free -m |grep "Swap" | awk '{print $3}')

#Drawing
echo "\033[0;36m      /\       \033[1;36mSytem:\033[0m Arch-Hardened"
echo "\033[0;36m     /  \      \033[1;36mPackages:\033[0m $pE:$pD"
echo "\033[0;36m    /    \     \033[1;36mShell:\033[0m $SHELL"
echo "\033[0;36m   /      \    \033[1;36mWM:\033[0m $win "
echo "\033[0;36m  /   \033[1;36m--   \033[0;36m\   \033[1;36mTheme:\033[0m $theme"
echo "\033[0;36m /\033[1;36m  _-  -_  \033[0;36m\  \033[1;36mFont:\033[0m $font"
echo "\033[0;36m/\033[1;36m_-        -_\033[0;36m\ \033[1;36mMemory:\033[0m $mem"


