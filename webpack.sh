#!/bin/bash

STATUS=""
WEBPACK_WINDOW=`tmux list-windows | grep "webpack"`
if [ -n "$WEBPACK_WINDOW" ]; then
  PANE_OUTPUT=`tmux capture-pane -t :webpack.1 -pS -50 | tail -r | sed '/build \[/q'`
  ERROR=`echo $PANE_OUTPUT | grep "ERROR"`
  BUILD_COMPLETED=`echo $PANE_OUTPUT | grep "Build completed"`
  BUILD_LINE=`echo $PANE_OUTPUT | grep "build"`
  if [ -n "$ERROR" ]; then
    STATUS="#[fg=colour1]●"
  elif [ -n "$BUILD_COMPLETED" ]; then
    STATUS="#[fg=colour2]●"
  elif [ -n "$BUILD_LINE" ]; then
    STATUS=`echo $BUILD_LINE | awk '/[0-9]+%/{print "#[fg=colour3]" $4}'`
  else
    STATUS="#[fg=colour3]●"
  fi
fi
echo $STATUS
