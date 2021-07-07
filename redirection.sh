#!/bin/bash
# redirection and file descriptor

# Redirect STDOUT and STDERR to a file.
FILE=/tmp/data
#head -n3 /etc/passwd /fakefile > ${FILE} 2>&1
head -n3 /etc/passwd /fakefile &> ${FILE}
echo "Contents of ${FILE}:"
cat ${FILE}
echo

# Redirect STDOUT and STDERR through a pipe.
head -n3 /etc/passwd /fakefile 2>&1 | cat -n
head -n3 /etc/passwd /fakefile |& cat -n
echo


#
INPUT_FILE=/tmp/input.txt
OUTPUT_FILE=/tmp/output.txt
RW_FILE=/tmp/rw.txt
echo "Hoge Fuga" > ${INPUT_FILE}
echo "Hoge               Fuga" > ${RW_FILE}
# cp /dev/null /tmp/rw.txt


echo --- Read

exec 3< ${INPUT_FILE}
cat <&3
exec 3<&-  # close


echo --- Write

exec 4> ${OUTPUT_FILE}
echo "Awawa" >&4
cat ${OUTPUT_FILE}
exec 4>&-  # close


echo --- Append

exec 5>> ${OUTPUT_FILE}
echo "appended" >&5
cat ${OUTPUT_FILE}
exec 5>&-  # close


echo --- Read Write
# file pointerに留意する

exec 6<> ${RW_FILE}
# cat <&6  # EOFまで移動する。
echo "Fefefe" >&6
# echo -n "Fefefe" >&6  # \nを出力しない
cat <&6  # 続きから
