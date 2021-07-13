#/bin/bash
# help let

echo Arithmetic Operation

echo '((n = 2**3 + 5))'
((n = 2**3 + 5))
echo n = $n

echo '((y = n ^ 4))'
((y = n ^ 4))  # XOR
echo y = $y

echo '((y = n | 4))'
((y = n | 4))
echo y = $y

echo '((y = n & 4))'
((y = n & 4))
echo y = $y

echo

echo Arithmetic Evaluation
echo '((0));echo $? =>' $( ((0));echo $? )  # 0 => 1 (false)
echo '((1));echo $? =>' $( ((1));echo $? )  # not 0 => 0 (true)
echo '((3));echo $? =>' $( ((3));echo $? )  # not 0 => 0 (true)

echo

echo Arithmetic Expansion
echo '$((1 + 1)) =>' $((1 + 1))
