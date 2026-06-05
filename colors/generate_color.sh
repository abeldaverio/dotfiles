#!/usr/bin/env sh

file="$1"

if [ -z "$file" ]; then file=$(dirname $0)"/current.txt"
fi

WAYBAR=""
RASI="* {\n"
CONF=""
FOOT="[env]\n"

generate_waybar() {
    WAYBAR="$WAYBAR""@define-color $1 #$2;""\n"
}

generate_rasi() {
    RASI="$RASI""\t""$1: #$2;""\n""\t""$1-transparent: #$2"aa";""\n"
}

generate_conf() {
    CONF="$CONF""\$$1 = $2""\n"
}

generate_foot() {
    FOOT="$FOOT""$1=$2""\n"
}

counter=0

while IFS='';read -r row_line; do
    counter=$(($counter + 1))
    clean_line=$(echo ${row_line%%#*} | xargs)
    IFS='='
    read -ra line <<< $clean_line
    if [ ${#line[@]} -ne 2 ]; then
        echo "error parsing ligne "$counter": invalid syntax"
        continue
    fi

    generate_waybar "${line[0]}" "${line[1]}"
    generate_rasi   "${line[0]}" "${line[1]}"
    generate_conf   "${line[0]}" "${line[1]}"
    generate_foot   "${line[0]}" "${line[1]}"

done <$file

DIR=$(dirname $0)

echo -e "$WAYBAR"        > $DIR/waybar.css
echo -e "$RASI""}""\n"   > $DIR/rofi.rasi
echo -e "$CONF"          > $DIR/hypr.conf
echo -e "$FOOT"          > $DIR/foot.env
