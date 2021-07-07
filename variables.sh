#!/bin/bash
declare -i x=111
x=-1
echo $x
let x++
echo $x

declare -l lstring="ABCdef"
echo lstring = $lstring
lstring="XyZ"
echo lstring = $lstring

declare -u ustring="ABCdef"
echo ustring = $ustring
ustring="XyZ"
echo ustring = $ustring

declare -r ro="A Value"
echo readonly = $readonly
ro="New Value"

declare -a Myarray
Myarray[2]="Second Value"
echo 'Myarray[2]= ' ${Myarray[2]}

declare -A Myarray2
Myarray2["hotdog"]="baseball"
echo 'Myarray2[hotdog]= ' ${Myarray2["hotdog"]}

# -n
declare -n myvar=hoge
hoge=fwfw
echo myvar is $myvar
hoge=awawa
echo myvar is $myvar

func() {
  FEFE="FeFe"
  # local variables
  declare HOGE="Hoge"
  local FUGA="Fuga"  # 関数の中でしか使えない以外はdeclareと同じ
}
func
echo $FEFE
echo $HOGE
echo $FUGA
