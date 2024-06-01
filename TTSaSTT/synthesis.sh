#!/bin/bash
function info_about_files {
    echo -e "Вы выбрали синтез речи!\n"
    while true
    do
        echo -e "Доступно 16 языков для распознавания, выберите один из них:\n1. Английский\n2. Бразильский португальский\n3. Голландский\n4. Иврит\n5. Испанский\n6. Итальянский\n7. Казахский\n8. Немецкий\n9. Польский\n10. Португальский\n11. Русский\n12. Турецкий\n13. Узбекский (латиница)\n14. Финский\n15. Французский\n16. Шведский\nВведите число: "
        read language 

        case $language in
        "1")
            #английский 
            LANGUAGE="en-US"
            clear
            break;;
        "2")
            #бразильский португальский 
            LANGUAGE="pt-BR"
            clear
            break;;
        "3")
            #голландский  
            LANGUAGE="nl-NL"
            clear
            break;;
        "4")
            #иврит
            LANGUAGE="he-HE"
            clear
            break;;
        "5")
            #испанский
            LANGUAGE="es-ES"
            clear
            break;;
        "6")
            #итальянский
            LANGUAGE="it-IT"
            clear
            break;;
        "7")
            #казахский 
            LANGUAGE="kk-KZ"
            clear
            break;;
        "8")
            #немецкий
            LANGUAGE="de-DE"
            clear
            break;;
        "9")
            #польский
            LANGUAGE="pl-PL"
            clear
            break;;
        "10")
            #португальский
            LANGUAGE="pt-PT"
            clear
            break;;
        "11")
            #русский
            LANGUAGE="ru-RU"
            clear
            break;;
        "12")
            #турецкий
            LANGUAGE="tr-TR"
            clear
            break;;
        "13")
            #узбекский
            LANGUAGE="uz-UZ"
            clear
            break;;
        "14")
            #финский
            LANGUAGE="fi-FI"
            clear
            break;;
        "15")
            #французский
            LANGUAGE="fr-FR"
            clear
            break;;
        "16")
            #шведский
            LANGUAGE="sv-SE"
            clear
            break;;
        *)
            echo -e "\nУпс! Некорректный выбор языка. Попробуйте ещё раз.\n"
            ;;
        esac
    done

    while true
    do
        echo "Введите имя входного файла (без расширения): "
        read input_file
        if [[ ! -f "$input_file.txt" ]] #проверка на существование входного файла
        then
            echo -e "\nФайл $input_file не существует. Попробуйте ещё раз.\n"
        else
            echo -e "Файл обнаружен!\n"
            break 
        fi
    done
    echo "Введите имя выходного файла (без расширения): "
    read output_file
}

function users_dir {
  # Проверить, существует ли каталог файлов для пользователя
  history_dir="./TTSaSTT/users_files/$login"
  if [[ ! -d "$history_dir" ]]
  then
    mkdir -p "$history_dir"
  fi
}

function synthesize_speech {
    users_dir
    info_about_files

    # Проверка обязательных параметров
    if [[ -z "$1" ]]
    then
        echo "Использование: $0 <путь_к_файлу_вывода>"
        return 1
    fi

  # Получение IAM-токена
  OAUTH_TOKEN=y0_AgAAAABJhN7jAATuwQAAAAEEzNQCAADlw4Ue-79DjoV3L8ovngB4N3Pazg
  curl -s -X POST \
	-o token.json \
  -d '{"yandexPassportOauthToken":"'"$OAUTH_TOKEN"'"}' \
  https://iam.api.cloud.yandex.net/iam/v1/tokens
  # Извлекаем значение поля из JSON
   TOKEN=($(jq -r '.iamToken' token.json))

  # Настройка параметров запроса
  FOLDER_ID=b1glg8l1kni6p8eqp5au
  INPUT_FILE="$input_file.txt"
  OUTPUT_FILE="./TTSaSTT/users_files/$login/$output_file"

  # Выполнение запроса к API Yandex Speechkit
  curl -s -X POST \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode text@${INPUT_FILE} \
	-o "$OUTPUT_FILE" \
    -d "lang=${LANGUAGE}&folderId=${FOLDER_ID}&format=mp3" \
    "https://tts.api.cloud.yandex.net/speech/v1/tts:synthesize"  

    save_history
}
