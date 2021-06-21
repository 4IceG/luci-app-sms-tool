#!/bin/sh

[ -e /etc/crontabs/root ] || touch /etc/crontabs/root

STAT=$(uci -q get sms_tool.general.lednotify)
if [ "x$STAT" != "x1" ]; then
	if grep -q "smsled" /etc/crontabs/root; then
		grep -v "/init.d/smsled" /etc/crontabs/root > /tmp/new_cron
		mv /tmp/new_cron /etc/crontabs/root
		/etc/init.d/cron restart
	fi
	exit 0
fi

if ! grep -q "smsled" /etc/crontabs/root; then
PTR=$(uci -q get sms_tool.general.prestart)
	echo "1 */$PTR * * * /etc/init.d/smsled disable && sleep 3 && /etc/init.d/smsled start" >> /etc/crontabs/root
	/etc/init.d/cron restart
fi

exit 0