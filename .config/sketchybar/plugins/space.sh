#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# WORKSPACE_BG=0xffffffff
# WORKSPACE_FG=0xff000000
# WORKSPACE_BG_OFF=0x00ffffff
# WORKSPACE_FG_OFF=0xffffffff

if [[ "$FOCUSED_WORKSPACE" != "" ]]
then
    sketchybar --set spacemarker \
        label=$FOCUSED_WORKSPACE
        # background.color=$WORKSPACE_BG label.color=$WORKSPACE_FG \
fi

# if [[ "$FOCUSED_WORKSPACE" == "$SID" ]]
# then
#     sketchybar --set $NAME background.color=$WORKSPACE_BG label.color=$WORKSPACE_FG
# else
#     sketchybar --set $NAME background.drawing=$WORKSPACE_BG_OFF label.color=$WORKSPACE_FG_OFF
# fi
