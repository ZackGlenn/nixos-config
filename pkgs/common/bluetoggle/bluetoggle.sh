#!/usr/bin/env bash

device=$1
connected=$(bluetoothctl devices Connected)
if [[ $(echo "$connected" | grep -c "$device") == 1 ]]; then
  bluetoothctl disconnect "$device"
else
  bluetoothctl connect "$device"
fi
