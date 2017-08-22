#!/usr/bin/env bash

nHeights=([1]=16 [2]=8 [3]=4 [4]=2 [5]=1);
vSpaces=([1]=1 [2]=3 [3]=5 [4]=7 [5]=9 [6]=11 [7]=13 [8]=15 [9]=17 [10]=19 [11]=21 [12]=23 [13]=25 [14]=27 [15]=29 [16]=31);
segment=()
branchLine=()

printFractal() {

  for ((n=$1; $n > 0; n--))
  do
    printForN ${nHeights[$n]};
  done
}

printForN() {

  printBranches $1
  #printLine "1"
}

fillInWhiteSpace() {

  y=$2
  for ((num=$1; $num > 0; num--))
  do
    segment+=('0');
  done 
}

printLine() {

  for i in $1
  do
    if [[ $i == 0 ]];
    then
      printf ' ';
    else
      printf '1';
    fi
  done

  printf "\n";
  segment=()
}

prepareLine() {

  for i in ${branchLine[@]}
  do
    length=${#i}
    allWhiteSpace=$((100 - $length))

    endingWhiteSpace=$(($allWhiteSpace / 2))
    beginningWhiteSpace=$(($endingWhiteSpace + 1))
    
    fillInWhiteSpace $beginningWhiteSpace
    segment+=($i})
    fillInWhiteSpace $endingWhiteSpace

    printLine ${segment[@]}
    printf "$i"
  done
}

branchLineInnerWhitespace() {

  for ((j=$1; $j > 0; j--))
  do
    branchLine+=(0);
  done
}

printBranches() {

  branchLine=()

  for ((x=$1; $x > 0; x--))
  do

    branchLine+=(1)
    branchLineInnerWhitespace ${vSpaces[$x]}
    branchLine+=(1)

    #prepareLine 

    printf "${branchLine}"

    branchLine=()
  done
}

read -p "enter number from 1-5 : " userN;
printFractal $userN
