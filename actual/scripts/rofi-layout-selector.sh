SCRIPT_NAME="$(ls ~/scripts/monitor_setups | rofi -dmenu)"
if [[ -n $SCRIPT_NAME ]]; then
	$(~/scripts/monitor_setups/$SCRIPT_NAME)
fi
