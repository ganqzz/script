#!/bin/bash
echo "### Here Document ###"

sort << END
cherry
banana
apple
orange
END

echo

while read a b c
do
  echo a:\"$a\" b:\"$b\" c:\"$c\"
done << EOF
one two three four
five six seven eight nine ten
eleven twelve
EOF

echo

var='(ToT)'
cat << "EOF"
$var
word
EOF

echo

# strip tabs not spaces
cat <<- EOF
		strip tabs
    not spaces
EOF

echo
echo "### Here String ###"
cat <<< "hoge
fuga

fefe
"
