#!/bin/sh

ask_yes_no() {
  while true; do
    echo -n "$* [y/n]: "
    read ANSWER
    case $ANSWER in
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
  echo "Yes"
else
  echo "No"
fi
