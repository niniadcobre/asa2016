#!/bin/bash

# NAUTILUS_SCRIPT_SELECTED_FILE_PATHS: newline-delimited paths for selected files (only if local)
# NAUTILUS_SCRIPT_SELECTED_URIS: newline-delimited URIs for selected files
# NAUTILUS_SCRIPT_CURRENT_URI: URI for current location
# NAUTILUS_SCRIPT_WINDOW_GEOMETRY: position and size of current window
# NAUTILUS_SCRIPT_NEXT_PANE_SELECTED_FILE_PATHS: newline-delimited paths for selected files in the inactive pane of a split-view window (only if local)
# NAUTILUS_SCRIPT_NEXT_PANE_SELECTED_URIS: newline-delimited URIs for selected files in the inactive pane of a split-view window
# NAUTILUS_SCRIPT_NEXT_PANE_CURRENT_URI: URI for current location in the inactive pane of a split-view window

function question {
ttl=$1
msg=$2
zenity  --question --title "$ttl"  --text  "$msg"
if [ $? -eq 0 ]; then
return 0 # caso POSITIVO, logica INVERSA a C
else
return 1
fi
}

function info {
msg=$1
zenity --info --text "$msg"
}

#-------------------------------------------------------------------
for arg
do
while question "OJITO" "Seguro que quiere borrar $arg?"
do
info "Pero seguro?"
done
info "Ah, bueno"
done
