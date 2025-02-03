swaymsg -t get_tree | jq '.. | select(.window_properties?.title? == "Obsidian") | .window_properties?.class'
