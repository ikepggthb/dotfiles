
#!/bin/bash

list=(
  "Lock Screen" "/home/azure/.config/rofi/lock.sh"
  "Logout"      "i3-msg exit"
  "Reboot"      "systemctl reboot"
  "Suspend"     "/home/azure/.config/rofi/lock.sh && systemctl suspend"
  "Shutdown"    "systemctl poweroff"
)

if [ -z "$@" ]; then
  for (( i=1; i<=$((${#list[@]}/2)); i++ )); do
    echo "${i}. ${list[$i*2-2]}"
  done
else
  for (( i=1; i<=$((${#list[@]}/2)); i++ )); do
    if [ "$@" == "${i}. ${list[$i*2-2]}" ]; then
      command="${list[$i*2-1]}"
      break
    fi
  done
  nohup bash -c "$command" >/dev/null 2>&1 &
fi


  #eval "${command:-:}"
