#!/bin/bash
nmcli r wifi off
notify-send "Wifi off.."
nmcli r wifi on
notify-send "Wifi back on..."
