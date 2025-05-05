#!/bin/bash

workspace=$(aerospace list-workspaces --focused)
if [[ $workspace == f* ]] ; then
    aerospace workspace ${workspace:1}
else
    if [[ $workspace == "0" ]] ; then
        aerospace workspace 0
    else
        aerospace workspace f$workspace
    fi
fi
