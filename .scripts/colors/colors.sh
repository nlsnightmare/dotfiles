#!/bin/bash

colors=(
    "#d30414"
    "#ff0000"
    "#00ff00"
    "#0000ff"
)

contrasts=(
    0.9,
    0.9
)

for color in ${colors[@]}
do
    echo "$color"
    hsetroot -tile ~/Pictures/pattern.jpeg -tint "$color" -contrast 0.9
    python test.py "$color"
    sleep 2.5
done
