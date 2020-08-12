#!/bin/sh
# Copyright 2020 Rafał Wabik (IceG) - From eko.one.pl forum
# Licensed to the GNU General Public License v3.0.

	DEV=$(uci -q get sms_tool.general.readport)
	LEDX=$(uci -q get sms_tool.general.smsled)
	# CT=$(uci -q get sms_tool.general.checktime)
	STX=$(sms_tool -s SM -d $DEV status | cut -c23-27)
	SMS=$(echo $STX | tr -dc '0-9')
	SMSC=$(cat /etc/config/sms_count)
	LED="/sys/class/leds/$LEDX/brightness"

while [ $SMS > $SMSC ]; do

    echo 1 > $LED
	sleep 3
  	echo 0 > $LED
	sleep 2

	DEV=$(uci -q get sms_tool.general.readport)
	# CT=$(uci -q get sms_tool.general.checktime)
	STX=$(sms_tool -s SM -d $DEV status | cut -c23-27)
	SMS=$(echo $STX | tr -dc '0-9')
	SMSC=$(cat /etc/config/sms_count)

  if [ $SMS == $SMSC ]; then
    break
  fi
done

exit 0
