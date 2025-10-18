#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100)
      ICON="􀛨"
      sketchybar --set "$NAME" drawing=off
  ;;
  [6-8][0-9])
      ICON="􀺸"
      sketchybar --set "$NAME" drawing=off
  ;;
  [3-5][0-9])
      ICON="􀺶"
      sketchybar --set "$NAME" drawing=on
  ;;
  [1-2][0-9])
      ICON="􀛩"
      sketchybar --set "$NAME" drawing=on
  ;;
  *) ICON="􀛪"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
  sketchybar --set "$NAME" drawing=off
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="" # label="${PERCENTAGE}%"

