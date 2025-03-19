#!/bin/bash

function get_index() {
    local value
    local array

    array=("$1")
    value=$2

    for i in "${!array[@]}"; do
       if [[ "${array[$i]}" = "${value}" ]]; then
           echo "${i}";
       fi
    done
}


mainFile="$HOME/.config/hypr/hyprland.conf"
declare -a mainKeymaps=("us" "de")

#
lineNumber=$(grep -n "kb_layout" "${mainFile}" | awk -F ':' '{print $1}')
currentKeymap=$(grep -n "kb_layout" "${mainFile}" | awk -F '= ' '{print $NF}')
get_index "${mainKeymaps[*]}" "$currentKeymap"

if [[ $currentKeymap = "us" ]]; then
    sed -i "${lineNumber}s/${currentKeymap}/de/" "${mainFile}"
elif [[ $currentKeymap = "de" ]]; then
    sed -i "${lineNumber}s/${currentKeymap}/al/" "${mainFile}"
elif [[ $currentKeymap = "al" ]]; then
    sed -i "${lineNumber}s/${currentKeymap}/us/" "${mainFile}"
fi
