scores='Gretchen Galloway	268	178	256	259	282	139	167
Isaac Steele	253	155	210	195	225	172	202
Wayne Myers	290	283	227	243	128	221	103
Lillith Lee	148	127	260	131	180	125	121
Molly Blackwell	299	143	202	267	222	159	227
Maia Arnold	204	198	294	158	254	205	253
Lev Reese	180	278	156	170	261	283	113
Carlos Guthrie	289	205	117	138	232	278	169
Sophia Buck	112	104	191	112	147	294	280
Vincent Mitchell	270	153	207	175	252	202	233
Buffy Harris	206	107	187	286	286	244	156
Reuben Miles	247	227	170	237	133	188	276
Brendan Fowler	265	166	145	278	170	237	291
Mason Hancock	217	231	271	187	284	179	262
Nigel Boone	236	282	196	143	290	284	129
Gretchen Foreman	276	228	186	223	156	257	161
Serena Goodman	189	145	137	155	211	183	133
Shoshana Velez	281	120	125	199	252	296	287
Eve Hughes	236	176	249	173	158	146	216
'

echo "$scores" | awk '
BEGIN {
  FS="\t";
  print "<table>";
  print "<tr>";
  print "  <th>Name</th>";
  for ( i=1; i<=7; i++ ) {
    print "  <th>Round " i "</th>";
  }
  print "</tr>";
}

{
  print "<tr>";
  print "  <td><b>" $1 "</b></td>";
  for ( i=2; i<=8; i++ ) {
    print "  <td>" $i "</td>";
    total[i] += $i;
  }
  print "</tr>";
}

END {
  print "<tr>";
  print "  <td><b><i>Average</i></b></td>";
  for ( i=2; i<=8; i++ ) {
    print "  <td><i>" int(total[i] / NR) "</i></td>";
  }
  print "</tr>";
  print "</table>";
}'
