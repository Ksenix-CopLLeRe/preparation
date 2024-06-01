#!/bin/bash
#задача на копирование пнг файлов
if [[ -z $* ]]
then
    echo "Нет аргументов"
fi
ch=1
mkdir -p output
for directory in $*
do 
    if [[ ! -d $directory ]]
    then
        echo "Нет директории $directory"
        continue 
    fi 

    for file in $(ls $directory)
    do 
        echo "cntrl point1"
        if [[ -f $dir/$file ]] & [[ $file == *.png ]]
        then
            echo "cntrl point 2"
            cp $directory/$file output/$ch.png
            ch=$(($ch+1))
        fi 
    done
done



#задача на аргументы и свитч кейс


#Скрипт, который принимает на вход названия файла входных данных и файла вывода как ключевые аргументы -i и -o соответственно. Скрипт считает количество вхождений слова в файле входных данных в зависимости от третьего аргумента, который это специфицирует. Этот аргумент принимается через ввод от пользователя. Ответ направляется в файл вывода.
read -p "Введите слово: " word
while [[ -n $1 ]]
do
    case $1 in
    -i)
        file_input=$2
        shift;;
    -o)
        file_output=$2
        shift;;
    *)
        echo "Аргумента нема"
        shift;;
    esac
done

for item in $(cat $file_input)
do
    
done


