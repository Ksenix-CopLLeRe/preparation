#!/bin/bash
. ./TTSaSTT/synthesis.sh
. ./TTSaSTT/functions.sh
separator="|"
db_name=users
attempts=3

read -p "Добро пожаловать в скрипт синтеза и распознавания речи! Зарегистрированы ли вы в системе? (y/n) " answer1
if [[ "$answer1" == "n" ]] 
then
    registration 
else
    echo "Авторизируйтесь в системе"
    read -p "Введите логин: " login
    login_pswd=$(check_login $login $db_name $separator)
    if [[ $? -eq 0 ]]
    then
        echo "Пользователь $login не был найден в базе!"
        exit
    fi

    while [[ $attempts -ne 0 ]]
    do
        read -s -p "Введите пароль: " password
        hash_pswd=$(hash_password $password)
        if [[ $login_pswd == $login$separator$hash_pswd ]]
        then
            echo "Вы успешно авторизированы"
            break
        else
            attempts=$(($attempts-1))
            echo "Пароль введен неверно, осталось $attempts попыток"
        fi

        if [[ attempts -eq 0 ]]
        then
            echo "Вы не смогли авторизоваться в системе!" 
            exit 
        fi
    done

    
fi

# Спросить пользователя, что ему надо
while true
do
    echo -e "\nВыберите действие:\n1. Посмотреть историю\n2. Синтез речи\n3. Выход\nВведите цифру: "
    read answer2
    if [[ "$answer2" == "1" ]]
    then
        show_history
    elif [[ "$answer2" == "2" ]]
    then
        synthesize_speech $output_file.mp3 
    elif [[ "$answer2" == "3" ]]
    then
        exit 
    else
        echo "Неправильно выбрано действие." 
    fi
done
