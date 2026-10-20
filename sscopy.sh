#!/bin/sh

image="/mnt/KSS/backUps/poco/dcim/screenshots/screenshot_$(date +%F_%H-%M-%S).png"

scrot -s "$image" || {
  notify-send "Errored ssc"
  return 1
}

copyq write image/png - < "$image"
copyq select 0

notify-send "wrote image🖼️"
