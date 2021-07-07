#!/bin/bash

input='awawa
<li>this is a <i>list</i> item</li>
<fuga>
<hoge></hoge>'

echo "$input" | awk '
BEGIN {
  FS = "[<>]"
}

/^<.*>$/ {
  if ($(NF-1) == ("/" $2)) {
    print
  }
}
'
