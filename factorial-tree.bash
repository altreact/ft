#!/usr/bin/env bash

nHeights=([1]=16 [2]=8 [3]=4 [4]=2 [5]=1);
vSpaces=([1]=1 [2]=3 [3]=5 [4]=7 [5]=9 [6]=11 [7]=13 [8]=15 [9]=17 [10]=19 [11]=21 [12]=23 [13]=25 [14]=27 [15]=29 [16]=31);

printFractal() {

  for ((n=$1; $n >= 0; n--))
  do
    printForN ${nHeights[$n]};
  done
}

printForN() {

  printBranches $1 "v"
  printLineRepeatedly $1 "t"
}

printBranches() {

  char=$2
  
  for ((x=$1; $x > 0; x--))
  do

    printf "$char";
    printCharRepeatedly ${vSpaces[$x]} " "
    printf "$char\n";
  done
}

printCharRepeatedly() {

  y=$2
  for ((num=$1; $num > 0; num--))
  do
    printf "$y";
  done 
}

printLineRepeatedly() {

  y=$2

  for ((num=$1; $num > 0; num--))
  do
    printf "$y\n";
  done 
}

read -p "enter number from 1-5 : " userN;
printFractal $userN
