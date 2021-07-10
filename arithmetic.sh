#/bin/bash
# help let

echo Arithmetic Operation
((n = 2**3 + 5))
echo n = $n
((y=n^4))  # XOR
echo y = $y
((y=n|4))
echo y = $y
((y=n&4))
echo y = $y

echo

echo Arithmetic Evaluation
echo '((0));echo $? =>' $( ((0));echo $? )  # 0 => 1 (false)
echo '((1));echo $? =>' $( ((1));echo $? )  # not 0 => 0 (true)
echo '((3));echo $? =>' $( ((3));echo $? )  # not 0 => 0 (true)

echo

echo Arithmetic Expansion
echo '$((1+1)) =>' $((1+1))
