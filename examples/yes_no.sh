#!/bin/bash

function ask_yes_no {
  while true; do
    echo -n "$* [y/n]: "
    read  # 省略したときは、"REPLY"になる
    case $REPLY in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        echo "yまたはnを入力してください"
        ;;
    esac
  done
}

if ask_yes_no "よろしいですか？"; then
  # ここに「Yes」の時の処理を書く
  echo "Yes"
else
  # ここに「No」の時の処理を書く
  echo "No"
fi
