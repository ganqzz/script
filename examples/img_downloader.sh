#!/bin/bash
# Desc: Images downloader
# Filename: img_downloader.sh

if [ $# -ne 3 ]
then
  echo "Usage: $0 URL -d DIRECTORY"
  exit -1
fi

for i in {1..4}
do
  case $1 in
  -d) shift; directory=$1; shift;;
   *) url=${url:-$1}; shift;;
  esac
done

mkdir -p $directory
baseurl=$(echo $url | egrep -o "https?://[a-z.]+")

echo Downloading $url
tmp_list=/tmp/$$.list
curl -s $url | egrep -o "<img src=[^>]*>" |
sed 's/<img src=\"\([^"]*\).*/\1/g' > $tmp_list

sed -i "s|^/|$baseurl/|" $tmp_list

cd $directory

while read filename
do
  echo Downloading $filename
  curl -s -O "$filename" --silent
done < $tmp_list

rm -f $tmp_list 2> /dev/null

exit 0
