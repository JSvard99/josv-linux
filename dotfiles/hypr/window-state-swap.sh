#!/bin/bash

hyprctl activewindow

windowInfo=`hyprctl activewindow`

if [[ "$windowInfo" =~ 'floating: 1' ]]; then
 echo floating
 hyprctl dispatch -q 'hl.dsp.window.float()'
elif [[ "$windowInfo" =~ 'tags: pseudo' ]]; then
 echo pseudo
 hyprctl dispatch -q 'hl.dsp.window.tag({ tag = "-pseudo" })'
 hyprctl dispatch -q 'hl.dsp.window.pseudo()'
 hyprctl dispatch -q 'hl.dsp.window.float()'
else
 echo tiled
 hyprctl dispatch -q 'hl.dsp.window.tag({ tag = "+pseudo" })'
 hyprctl dispatch -q 'hl.dsp.window.pseudo()'
fi
