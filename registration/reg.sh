#!/bin/bash
. ./registration/fshs.sh
. ./registration/auth.sh



separator="|"
db_name="users"

echo "Добро пожаловать в скрипт регистрации!"
read -p "Введите логин (любые символы, кроме $separator): " login
# проверка на непустоту логина
if [[ ! -n $login ]]
then
    echo "Логин не может быть пустым"
    exit
fi
# проверка на отсутствие разделителя в логине
if [[ $login == *$separator* ]]
then
    echo "Логин не должен содержать разделитель $separator"
    exit
fi

# проверка отсутствия логина в базе
if [[ -f $db_name ]]
then
    if ! check_login $login $db_name $separator > /dev/null
    then
        echo "Пользователь $login уже зарегестрирован"
        exit
    fi
fi

echo "Логин $login был принят от пользователя успешно"
read -s -p "Введите пароль: " password
read -s -p "Повторите пароль: " repeat

if [[ ! -n $password ]]
then 
    echo "Пароль не может быть пустым"
elif [[ $password != $repeat ]]
then
    echo "Введенные пароли не совпадают"
else
    hash_pswd=$(hash_password $password)
    echo "Пользователь $login был успешно зарегестрирован в системе!"
    echo "$login$separator$hash_pswd" >> $db_name
fi