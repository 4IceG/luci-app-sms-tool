#!/bin/sh
# Copyright 2020 Rafał Wabik (IceG) - From eko.one.pl forum
# Licensed to the GNU General Public License v3.0.

	DEV=$(uci -q get sms_tool.general.readport)
	LEDX=$(uci -q get sms_tool.general.smsled)
	STX=$(sms_tool -s SM -d $DEV status | cut -c23-27)
	SMS=$(echo $STX | tr -dc '0-9')
	SMSC=$(cat /etc/config/sms_count)
	LED="/sys/class/leds/$LEDX/brightness"

if [ $SMS == $SMSC ]; then
    exit 0
fi

while [ $SMS > $SMSC ]; do

	DEV=$(uci -q get sms_tool.general.readport)
    LON=$(uci -q get sms_tool.general.ledtimeon)
    LOFF=$(uci -q get sms_tool.general.ledtimeoff)
	STX=$(sms_tool -s SM -d $DEV status | cut -c23-27)
	SMS=$(echo $STX | tr -dc '0-9')
	SMSC=$(cat /etc/config/sms_count)

    echo 1 > $LED
	sleep $LON
  	echo 0 > $LED
	sleep $LOFF

  if [ $SMS == $SMSC ]; then
    break
  fi
done

exit 0
