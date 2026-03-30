#!/usr/bin/env bash

statefile=$(dirname $0)/.state
IFS=' '

case $(cat $statefile) in
name)
    line=$(nmcli | grep "wlan0:")
    read -ra arr <<< "$line"
    if [ ${#arr[@]} -gt 1 ]; then
        if [ ${arr[1]} == "disconnected" ]; then
            text="disconnected"
            class="disconnected"
        elif [ ${#arr[@]} -eq 4 ] && [ ${arr[1]} == "connected" ]; then
            text=${arr[3]}
            class="connected"
            icon="<span color='#$(~/.config/colors/get_color.sh secondary)'></span>"
        fi
    fi
    ;;
ip)
    line=$(nmcli | awk '/^wlan0:/{flag=1; next} /^[^ \t]/{flag=0} flag && /^\t/' | grep inet4)
    read -ra arr <<< "$line"
    if [ ${#arr[@]} -eq 2 ]; then
        text=${arr[1]}
        class="connected"
        icon="<span color='#$(~/.config/colors/get_color.sh secondary)'></span>"
    else
        text="disconnected"
        class="disconnected"
    fi
    ;;
esac

printf "{\"text\": \"%s %s\", \"class\": \"%s\"}" "$text" "$icon" "$class"
