text=$( grep -n 'kb_layout' '/home/lz/.config/hypr/hyprland.lua'| sed -E 's/.*=[[:space:]]*"([^"]*)".*/\1/')
echo "${text}"
