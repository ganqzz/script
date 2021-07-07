# to upper first three words
s/ /#/3
h
s/#.*$//
y/abcdefghijklmnopqrstubwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
G
s/\n.*#/ /
