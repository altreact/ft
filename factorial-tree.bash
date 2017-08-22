#!/usr/bin/env bash

nHeights=([1]=16 [2]=8 [3]=4 [4]=2 [5]=1);
vSpaces=([1]=1 [2]=3 [3]=5 [4]=7 [5]=9 [6]=11 [7]=13 [8]=15 [9]=17 [10]=19 [11]=21 [12]=23 [13]=25 [14]=27 [15]=29 [16]=31);

printFractal() {

  for ((n=$1; $n > 0; n--))
  do
    printForN ${nHeights[$n]};
  done
}

printForN() {

  printBranches $1
  printTrunks $1 "1"
}

fillInWhiteSpace() {

  whiteSpace=""
  space="0"

  for ((num=$1; $num > 0; num--))
  do
    whiteSpace="$whiteSpace$space"
  done 
  
  echo "$whiteSpace"
}

prepareLine() {

  line=""
  length=${#1}
  allWhiteSpace=$((100 - $length))

  endingWhiteSpace=$(($allWhiteSpace / 2))
  beginningWhiteSpace=$(($endingWhiteSpace + 1))
  
  bLine="$(fillInWhiteSpace $beginningWhiteSpace)"
  eline="$(fillInWhiteSpace $endingWhiteSpace)"
  line="$bLine$1$eLine"

  echo $line | sed "s/0/ /g";
}

branchLineInnerWhitespace() {

  b=""
  space="0"

  for ((j=$1; $j > 0; j--))
  do
    b="$b$space";
  done

  echo "$b"
}

printBranches() {

  branchline=""
  one="1"

  for ((x=$1; $x > 0; x--))
  do

    b="$(branchLineInnerWhitespace ${vSpaces[$x]})"
    branchLine="$one$b$one"
    
    prepareLine $branchLine
  done
}

printTrunks() {

  for ((z=$1; $z > 0; z--))
  do
    prepareLine $2
  done
}

read -p "enter number from 1-5 : " userN;
printFractal $userN
