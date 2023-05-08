#!/bin/bash

a="Hello"
b="World"
c="$a $b"

echo $a
echo $b
echo $c

echo
echo --- Case conversion ---
echo ${c^}  # upper first
echo ${c^^}  # upper all
echo ${c,}  # lower first
echo ${c,,}  # lower all
echo ${c~}  # swap first
echo ${c~~}  # swap all

echo
echo --- Unset or Empty param exapansion ---
# Unset or Empty param expansion
# With ":", treat empty variable same as unset variable

# - default value
echo ${d-hoge}  # => hoge
echo ${d:-hoge}  # => hoge
d=
echo ${d-hoge}  # => ""
echo ${d:-hoge}  # => hoge
d=fuga
echo ${d-hoge}  # => fuga
echo ${d:-hoge}  # => fuga
echo $d  # => fuga

# + alternate value
echo ${e+hoge}  # => ""
echo ${e:+hoge}  # => ""
e=
echo ${e+hoge}  # => hoge
echo $e
echo ${e:+hoge}  # => ""
e=fuga
echo ${e+hoge}  # => hoge
echo ${e:+hoge}  # => hoge
echo $e  # => fuga

# = assign default value
echo ${f=hoge}  # => hoge
echo $f  # => hoge
unset f
echo ${f:=hoge}  # => hoge
echo $f  # => hoge

f=
echo ${f=hoge}  # => ""
echo $f  # => ""
echo ${f:=hoge}  # => hoge
echo $f  # => hoge

f=fuga
echo ${f=hoge}  # => fuga
echo ${f:=hoge}  # => fuga
echo $f # => fuga


# Slice ${var:offset:length}
echo
echo --- Slice ---
echo $c
echo ${#c}  # length
echo ${c:3}
echo ${c:3:4}
echo ${c: -4}  # space is required
echo ${c:(-4)}  # same
echo ${c: -4:3}
echo ${c:(-4):3}

# Substitution
echo
echo --- Substitution ---
fruits="apple banana banana cherry orange"
echo $fruits
echo ${fruits/banana/durian}
echo ${fruits//banana/durian}
echo ${fruits/#apple/durian}
echo ${fruits/#banana/durian}
echo ${fruits/%orange/durian}
echo ${fruits/%banana/durian}
echo ${fruits/c*/durian}
echo ${fruits/b*/durian}
echo ${fruits/p*/durian}

# Remove
echo
echo --- Remove ---
str="fefe.awawa.piyo.fuga"
echo $str
echo ${str#*.}  # remove shortest match from first
echo ${str##*.}  # remove longest match from first
echo ${str%.*}  # remove shortest match from last
echo ${str%%.*}  # remove longest match from last

# ABEND
echo
echo --- ABEND if Empty ---
echo '${var:?}'
echo ${var:?}  # if empty, error and exit
echo --- End ---  # do not execute
