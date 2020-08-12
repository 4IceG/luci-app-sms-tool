#!/bin/sh
# Copyright 2020 Rafał Wabik (IceG) - From eko.one.pl forum
# Licensed to the GNU General Public License v3.0.

[ -e /etc/crontabs/root ] || touch /etc/crontabs/root

LED=$(uci -q get sms_tool.general.lednotify)
if [ "x$LED" != "x1" ]; then
	if grep -q "smsled.sh" /etc/crontabs/root; then
		grep -v "/sbin/smsled.sh" /etc/crontabs/root > /tmp/new_cron
		mv /tmp/new_cron /etc/crontabs/root
		/etc/init.d/cron restart
	fi
	exit 0
fi

if ! grep -q "smsled.sh" /etc/crontabs/root; then

	CT=$(uci -q get sms_tool.general.checktime)

	echo "*/$CT * * * * /sbin/smsled.sh" >> /etc/crontabs/root
	/etc/init.d/cron restart
fi

exit 0