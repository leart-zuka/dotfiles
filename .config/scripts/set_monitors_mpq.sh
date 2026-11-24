#!/usr/bin/env bash

monitor1=$(hyprctl monitors | grep "DP-10")
monitor2=$(hyprctl monitors | grep "DP-11")

if [[ ! -z $monitor1 ]] && [[ ! -z $monitor2 ]];then
    hyprctl keyword monitor DP-10,1920x1200,-960x-1200,1 &>/dev/null
    hyprctl keyword monitor DP-11,1920x1200,960x-1200,1 &>/dev/null
elif [[ ! -z $monitor1 ]]; then
    hyprctl keyword monitor DP-10,1920x1200,0x-1200,1 &>/dev/null
elif [[ ! -z $monitor2 ]]; then
    hyprctl keyword monitor DP-11,1920x1200,0x-1200,1 &>/dev/null
fi
