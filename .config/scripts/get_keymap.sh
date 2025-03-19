text=$(grep -n 'kb_layout' '/home/lz/.config/hypr/hyprland.conf' | awk -F '= ' '{print $NF}')
echo "${text}"
