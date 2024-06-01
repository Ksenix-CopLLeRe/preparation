#!/bin/bash

cpass=0
cunpass=0
c2=0
c3=0
c4=0
c5=0

if [[ ! -f $1 ]]
then
    echo "Файла $1 не существует"
    exit
fi

for line in $(cat $1)
do
    if [[ $line == 5 ]]
    then
        c5=$(($c5+1))
    elif [[ $line == *4 ]]
    then
        c5=$(($c4+1))
    elif [[ $line == *3 ]]
    then
        c5=$(($c3+1))
    elif [[ $line == *2 ]]
    then
        c5=$(($c2+1))
    fi
done


markscount=$(($c2+$c3+$c4+$c5))
cpass=$(($c3+$c4+$c5))
passed_stat=$(($cpass*100/$markcount))
failed_stat=$(($c2*100/$markcount))
mark=2
for stat in $c2 $c3 $c4 $c5
do
    echo "Статистика по оценке $mark"
    echo "Количество оценок $mark: $stat"
    stat=$(($stat*100/$markcount))
    echo "Статистика по оценке $mark: $stat"
    mark=$(($mark+1))
done


