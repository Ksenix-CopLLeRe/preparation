function registration {
    
    echo "Пройдите регистрацию"
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
}

function check_login {
    login=$1
    db_name=$2
    separator=$3

    for line in $(cat $db_name)
    do
        if [[ $line == $login$separator* ]]
        then
            echo $line
            return 1
        fi
    done
}

function hash_password {
    echo $password | sha256sum | awk '{print $1}'
}

function save_history {
  # Получить имя файла
  file_name=$output_file

  # Проверить, существует ли каталог истории для пользователя
  history_dir="./TTSaSTT/history/$login"
  if [[ ! -d "$history_dir" ]]
  then
    mkdir -p "$history_dir"
  fi

  # Записать имя файла в файл истории пользователя
  echo "$file_name.mp3" >> "$history_dir/$login.txt"
}

function show_history {
  # Получить каталог истории для пользователя
  history_dir="./TTSaSTT/history/$login"

  # Проверить, существует ли каталог истории
  if [[ ! -d "$history_dir" ]]
  then
    echo "Нет истории для пользователя $login."
    return
  fi

  echo "История для пользователя $login:"
  cat ./TTSaSTT/history/$login/$login.txt
}