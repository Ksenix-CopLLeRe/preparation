#!/bin/bash

# есть файл с числами, каждое число написано с новой строки. Нужно вывести все четные числа, вывести их в файл even_numbers; вывессти статистику: сколько четных и нечетных; скрипт принимает аргумент, если 0 - фильтруем четные, если 1 - нечетные.
numbers_file=numbers.txt

target=0
other=0

if [[ ! -f $numbers_file ]] #если файл не существует
then
    echo "File $numbers_file doesn't exist"
    exit
fi

if [[ ! -n $1 ]] 
then
    echo "There is no argument"
    exit
elif [[ $1 != "0" && $1 != "1" ]] 
then
    echo "Unknown argument: $1"
    exit
fi

for number in $(cat $numbers_file)
do
    if [[ $(($number % 2)) -eq $1 ]] 
    then
        echo $number
        target=$(($target+1))  
    else
        other=$(($other+1))
    fi
done > target_numbers.txt

if [[ $1 == "1" ]] 
then
    echo "Нечетных чисел: $target"
    echo "Четных чисел: $other"
else
    echo "Четных чисел: $target"
    echo "Нечетных чисел: $other"
fi


