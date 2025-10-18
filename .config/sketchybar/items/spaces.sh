#!/bin/bash

WORKSPACE_BG=0xffffffff
WORKSPACE_BG_OFF=0x00ffffff

sketchybar --add event space_changed

label=$(aerospace list-workspaces --focused)

space=(
    icon.drawing=off
    label=$label
    label.padding_left=8
    label.padding_right=8
    padding_left=0
    padding_right=0
    # label.color=0xff000000
    # background.color=0xffffffff
    background.drawing=on
    script="$PLUGIN_DIR/space.sh"
    width=24
)
sketchybar --add item spacemarker left \
           --set      spacemarker "${space[@]}" \
           --subscribe spacemarker space_changed

# SPACE_ICONS=("1" "2" "3" "4" "5" "0")

# sid=0
# for i in "${!SPACE_ICONS[@]}"
# do
#   sid=${SPACE_ICONS[i]}
#
#   space=(
#     icon.drawing=off
#     label=${SPACE_ICONS[i]}
#     label.padding_left=8
#     label.padding_right=8
#     padding_left=0
#     padding_right=0
#     background.color=0x00ffffff
#     background.drawing=on
#     script="$PLUGIN_DIR/space.sh"
#     width=24
#   )
#
#   sketchybar --add item space.$sid left    \
#              --set      space.$sid "${space[@]}" \
#              --subscribe space.$sid space_changed
# done
#
# spaces=(
#   background.color=$BG
#   background.drawing=on
#   background.height=24
#   blur_radius=10
# )
#
#
#
# sketchybar --add bracket spaces '/space\..*/' \
#            --set spaces "${spaces[@]}"        \
