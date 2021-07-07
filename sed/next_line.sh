#!/bin/bash
seq 7 | sed 'n;n;s/./x/'

echo ---
seq 7 | sed 'N;s/\n/ - /'
