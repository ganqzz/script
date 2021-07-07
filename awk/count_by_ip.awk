#!/usr/bin/awk -f
# ./count_by_ip.awk /var/log/apache2/access.log

BEGIN {
  FS=" "
  print "*** Count by IP ***"
}

{ ip[$1]++ }

END {
  for (i in ip)
    print i, " has accessed", ip[i], "times."
}
