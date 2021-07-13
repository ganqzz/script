#!/bin/sh
echo "$0"
echo `ps -p $$ -oargs=`
echo `ps -p $$ -ocomm=`
