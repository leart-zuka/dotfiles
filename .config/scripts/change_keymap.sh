#!/usr/bin/env bash

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


mainFile="$HOME/.config/hypr/hyprland.lua"
declare -a mainKeymaps=("us" "de")

#
lineNumber=$(grep -n "kb_layout" "${mainFile}" | awk -F ':' '{print $1}')
currentKeymap=$(sed -n "${lineNumber}p" "${mainFile}" | sed -E 's/.*=[[:space:]]*"([^"]*)".*/\1/')
echo "$lineNumber"
echo "$currentKeymap"

get_index "${mainKeymaps[*]}" "$currentKeymap"

echo "$currentKeymap"

if [[ ${currentKeymap} = "us" ]]; then
    echo "bla"
    sed -i "${lineNumber}s/${currentKeymap}/de/" "${mainFile}"
elif [[ $currentKeymap = "de" ]]; then
    sed -i "${lineNumber}s/${currentKeymap}/us/" "${mainFile}"
fi
