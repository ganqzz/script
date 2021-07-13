#!/bin/bash
# redirection and file descriptor
set -e

DEMO_DIR=/tmp/redirect_demo
FILE=${DEMO_DIR}/stub.txt

if [ -e "${DEMO_DIR}" ]; then
  rm -rf
fi

mkdir -p "${DEMO_DIR}"

# Redirect STDOUT and STDERR to a file.
head -n3 /etc/passwd > ${FILE} 2>&1
head -n3 /etc/passwd &> ${FILE}  # bash shorthand
echo "Contents of ${FILE}:"
cat ${FILE}
echo

# Redirect STDOUT and STDERR through a pipe.
head -n3 /etc/passwd 2>&1 | cat -n
head -n3 /etc/passwd |& cat -n  # bash shorthand
echo

#
INPUT_FILE=${DEMO_DIR}/input.txt
OUTPUT_FILE=${DEMO_DIR}/output.txt
RW_FILE=${DEMO_DIR}/rw.txt
echo "Hoge Fuga" > ${INPUT_FILE}
echo "123456789               Fuga" > ${RW_FILE}

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
echo -n "abcd" >&6
cat <&6  # 続きから
cat ${RW_FILE}
