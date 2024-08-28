#!/bin/bash
/usr/bin/gdialog --textbox /etc/motd 80 80
[ $? -ne 0 ] && xfce4-session-logout --reboot --fast
