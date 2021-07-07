# convert _ to tag
: top
/_/ {
  x
  /ON/! {
    s/.*/ON/
    x
    s;_;<i>;
  }
  /ON/ {
    s/.*/OFF/
    x
    s;_;</i>;
  }
  b top
}

