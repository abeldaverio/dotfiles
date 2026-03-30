#!/usr/bin/env sh

render_classes() {
    local arr=("$@")
    local r

    if [ ${#arr[@]} -eq 1 ]; then
        printf '"%s"\n' "${arr[0]}"
    else
        r="["
        for i in "${!arr[@]}"; do
            [ $i -ne 0 ] && r+=", "
            r+="\"${arr[i]}\""
        done
        r+="]"
        echo "$r"
    fi
}

swaync-client -s | while read line; do
    count=$(echo $line | jq -r ".count")
    dnd=$(echo $line | jq -r ".dnd")
    visible=$(echo $line | jq -r ".visible")

    classes=("normal")

    tooltip="$count Notifications"
    if [[ $count -eq 0 || $dnd ==  "true" ]]; then
        text=" "
    else
        classes+=("notification")
        if [ $count -gt 9 ]; then
            text="+"
        else
            text=$count
        fi
    fi
    if [ $visible == "true" ]; then
        classes+=("visible")
    fi
    if [ $dnd == "true" ]; then
        tooltip="Do not disturb"
    fi
    printf "{\"text\": \"<span color=\'%s\'>%s</span>\", \"alt\": \"dnd-%s\", \"tooltip\": \"%s\", \"class\": %s}\n" "#$(.config/colors/get_color.sh complementary)" "$text" "$dnd" "$tooltip" "$(render_classes "${classes[@]}")"
done
