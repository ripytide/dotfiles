#! /bin/sh
a=$(acpi -b | grep -E -o "..%")
if [[ ${a::-1} -le $1 ]] && [[ ${a::-1} -ne "00" ]]
then
	notify-send "Battery Low!!!" -u critical
fi