#!/bin/bash
. ./registration/fshs.sh

db_name=users
separator="|"
attempts=3

echo "Добро пожаловать в скрипт авторизации!"
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
        exit 0
    else
        attempts=$(($attempts-1))
        echo "Пароль введен неверно, осталось $attempts попыток"
    fi
done

echo "Вы не смогли авторизоваться в системе!"
capture_intruder
exit 2