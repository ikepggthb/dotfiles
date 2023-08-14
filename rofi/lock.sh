#!/bin/bash

# env >~/rofi_env.log

# i3lockコマンドのパス
i3lock_cmd="i3lock-fancy-rapid"

# i3lockのオプション
i3lock_options="10 10 -e -f"

# rofiが終了するのを待つために一時的にスリープする
sleep 0.5

# i3lockを実行する
$i3lock_cmd $i3lock_options  # >~/i3lock.log 2>&1
