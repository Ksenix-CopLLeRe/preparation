#!/bin/bash 
function synthesize_speech() {
  # Проверка обязательных параметров
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Использование: $0 <текст> <путь_к_файлу_вывода>"
    return 1
  fi

  # Получение IAM-токена
  OAUTH_TOKEN=y0_AgAAAABJhN7jAATuwQAAAAEEzNQCAADlw4Ue-79DjoV3L8ovngB4N3Pazg
  curl -X POST \
	-o token.json \
    -d '{"yandexPassportOauthToken":"'"$OAUTH_TOKEN"'"}' \
    https://iam.api.cloud.yandex.net/iam/v1/tokens
  # Извлекаем значение поля из JSON
   TOKEN=($(jq -r '.iamToken' token.json))

  # Настройка параметров запроса
  FOLDER_ID=b1glg8l1kni6p8eqp5au
  TEXT="$1"
  OUTPUT_FILE="$2"
  FORMAT="mp3"
  LANG="ru-RU"

  # Выполнение запроса к API Yandex Speechkit

  curl -X POST \
    -H "Authorization: Bearer ${TOKEN}" \
    --data-urlencode "text=${TEXT}" \
	-o "$OUTPUT_FILE" \
    -d "lang=ru-RU&folderId=${FOLDER_ID}&format=mp3" \
    "https://tts.api.cloud.yandex.net/speech/v1/tts:synthesize"  
	
  # Проверка ответа
  if [ $? -ne 0 ]; then
    echo "Ошибка при выполнении запроса к API"
    read -n 1 -s -r -p "Нажмите любую кнопку для продолжения"
    return 1
  fi
  echo "Файл речи сохранен в $OUTPUT_FILE"
  read -n 1 -s -r -p "Нажмите любую кнопку для продолжения"  
}

synthesize_speech "Привет, мир" hello.mp3
