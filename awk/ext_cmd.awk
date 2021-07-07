#!/usr/bin/awk -f
BEGIN {
  cmd = "seq 10";
  cmd_out = ""
  while(ret = cmd | getline step_out) {
    cmd_out = cmd_out (cmd_out == "" ? "" : "\n") step_out
  }
  print cmd_out
  close(cmd)
}
