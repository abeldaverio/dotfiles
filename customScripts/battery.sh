#!/usr/bin/env bash
dir=/sys/class/power_supply/BAT1/
status=$(cat $dir/status)
percent=$(cat $dir/capacity)

if [[ $status == "Discharging" || $status == "Not charging" ]]; then
    battery_discharge=(󰁺 󰁺 󰁻 󰁻 󰁼 󰁼 󰁽 󰁽 󰁾 󰁾 󰁿 󰁿 󰂀 󰂀 󰂁 󰂁 󰂂 󰂂 󰁹 󰁹)
    icon=${battery_discharge[$(($percent * $((${#battery_discharge[@]} - 1)) / 100))]}
    if   [ $percent -lt 15 ]; then color=error
    elif [ $percent -lt 30 ]; then color=warning
    elif [ $percent -lt 97 ]; then color=primary
    else                           color=secondary
    fi
elif [ $status == "Charging" ]; then
    icon=󰂄
    color=secondary
fi

if [ "$1" == "--text" ]; then
    if [[ $color == primary || $color == secondary ]]; then color=complementary
    fi
    printf "%d%% <span color=\'%s\'>%s</span>" "$percent" "#$(~/.config/colors/get_color.sh $color)" "$icon"
else
    printf "{\"text\": \"<span color=\'%s\'>%s</span>\", \"percentage\": %d}" "#$(~/.config/colors/get_color.sh $color)" "$icon" "$percent"
fi
