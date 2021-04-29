#! /bin/bash
if [[ $(isfloaty.sh) != "yes" ]]
then
case $1 in
	"west")
		if [ "$(islocalwindow.sh east)" = "yes" ]
		then
			bspc node -z right -20 0
		else
			bspc node -z left -20 0
		fi
		;;
	"east")
		if [ "$(islocalwindow.sh west)" = "yes" ]
		then
			bspc node -z left 20 0
		else
			bspc node -z right 20 0
		fi
		;;
	"north")
		if [ "$(islocalwindow.sh south)" = "yes" ]
		then
			bspc node -z bottom 0 -20
		else
			bspc node -z top 0 -20
		fi
		;;
	"south")
		if [ "$(islocalwindow.sh north)" = "yes" ]
		then
			bspc node -z top 0 20
		else
			bspc node -z bottom 0 20
		fi
		;;
	*)
		;;
esac
else
case $1 in
	"west")
			bspc node -z right -10 0
			bspc node -z left 10 0
		;;
	"east")
			bspc node -z left -10 0
			bspc node -z right 10 0
		;;
	"north")
			bspc node -z bottom 0 10
			bspc node -z top 0 -10
		;;
	"south")
			bspc node -z top 0 10
			bspc node -z bottom 0 -10
		;;
	*)
		;;
esac
fi
