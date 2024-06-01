#!/bin/bash

# # Задайте идентификатор каталога и IAM-токен
# FOLDER_ID="b1glg8l1kni6p8eqp5au"
# IAM_TOKEN="t1.9euelZqNjJrKl4mJi56cjpWUypyLiu3rnpWalsyamJSUnJWJx5SbjI-YnMrl9PdaPHBN-e9eIySa3fT3GmttTfnvXiMkms3n9euelZqJi5mVis2byp7JjY2elpKLme_8xeuelZqJi5mVis2byp7JjY2elpKLmQ.D5SluLtE6Gz48x86mNGetB2puWJ10Swv5BU6cA_buZmq3WmyTDbBI7JKqxwlOS3G61FBOoqGoHNnxAItWC-1CQ"

# # Считайте содержимое OGG-файла
# data=$(cat irlandman.ogg)

# # Сформируйте параметры запроса
# params="topic=general&folderId=$FOLDER_ID&lang=ru-RU"

# # Сформируйте URL-адрес запроса
# url="https://stt.api.cloud.yandex.net/speech/v1/stt:recognize?$params"

# # Установите заголовок авторизации
# header="Authorization: Bearer $IAM_TOKEN"

# # Отправьте запрос
# response=$(curl -K curl.cfg)


# # Извлеките ответ в формате JSON
# decodedData=$(echo "$response" | jq -r '.')

# # # Проверьте наличие ошибок
# # if [ "${decodedData.error_code}" == "null" ]; then
# #   # Выведите результат распознавания
# #   echo "${decodedData.result}"
# # fi

#!/bin/bash

# # Функция синтеза речи на bash с использованием Yandex TTS
# function synthesize_speech() {
#   # Проверить, указан ли текст для синтеза
#   if [ $# -eq 0 ]; then
#     echo "Ошибка: не указан текст для синтеза."
#     return 1
#   fi

# #   # Получить токен доступа к Yandex TTS
# #   token=$(curl -X POST "https://iam.api.cloud.yandex.net/iam/v1/tokens" \
# #     -H "Content-Type: application/json" \
# #     -d "{\"yandexPassportOauthToken\": \"$API_KEY\"}" | jq -r '.iamToken')

#   export folder_id="b1glg8l1kni6p8eqp5au"
  # export token="yc iam create-token"
#   curl -X POST \
#     -H "Authorization: Bearer ${token}" \
#    --data-binary "@speech.ogg" \
#    "https://stt.api.cloud.yandex.net/speech/v1/stt:recognize?topic=general&folderId=${folder_id}"
#   # curl -X GET \
#   # -H "Authorization: Bearer ${token}" \
#   # https://resource-manager.api.cloud.yandex.net/resource-manager/v1/clouds

#   # Проверить, получен ли токен
#   if [ -z "$token" ]; then
#     echo "Ошибка: не удалось получить токен доступа к Yandex TTS."
#     return 1
#   fi

#   # Синтезировать речь
#   response=$(curl -X POST "https://tts.api.cloud.yandex.net/speech/v1/tts:synthesize" \
#     -H "Authorization: Bearer $token" \
#     -H "Content-Type: application/json" \
#     -d "{\"text\": \"$1\", \"lang\": \"ru-RU\", \"voice\": \"alyss\"}")

#   # Проверить код ответа
#   if [ $(echo $response | jq -r '.code') != 200 ]; then
#     echo "Ошибка: сайт вернул код ответа $(echo $response | jq -r '.code')."
#     return 1
#   fi

#   # Получить ссылку на синтезированную речь
#   audio_url=$(echo $response | jq -r '.audioContent')

#   # Скачать синтезированную речь
#   curl -o ruspeech.mp3 "$audio_url"

#   echo "Синтезированная речь сохранена в файл ruspeech.mp3."
# }

# API_KEY="AQVN1Y80AEPLPJoldTsXf7E7Nqdqwdv36MjT2Yim"  # Замените на ваш API-ключ Yandex TTS
# synthesize_speech "rutext.sh"






#!/bin/bash

# Функция для распознавания речи
# function recognize_speech() {
#   # Проверить, указан ли аудиофайл
#   if [ $# -eq 0 ]; then
#     echo "Ошибка: не указан аудиофайл для распознавания."
#     return 1
#   fi

#   # Проверить, существует ли аудиофайл
#   if [ ! -f "$1" ]; then
#     echo "Ошибка: указанный аудиофайл не существует."
#     return 1
#   fi
# inputfile="ruAlisaspeech.ogg"
# export folder_id="b1glg8l1kni6p8eqp5au"
# API_KEY="AQVN1Y80AEPLPJoldTsXf7E7Nqdqwdv36MjT2Yim"
# # folder_id="b1glg8l1kni6p8eqp5au"
#   # Получить токен доступа к Yandex SpeechKit
# export token=$(yc iam create-token)


# response=$(curl -X POST \
#      -H "Authorization: Bearer $token" \
#      --data-binary "ruAlisaspeech.ogg" \
#      -d "lang=ru-RU&folderId=${FOLDER_ID}&format=lpcm&sampleRateHertz=48000\
#      &emotion=good&voice=ermil" \
#      "https://stt.api.cloud.yandex.net/speech/v1/stt:recognize?topic=general&folderId=$folder_id")


#   # Проверить, получен ли токен
# if [[ -z "$token" ]]; then
#     echo "Ошибка: не удалось получить токен доступа к Yandex SpeechKit."
#     return 1
# fi

# #   # # Распознать речь
# #   # response=$(curl -X POST "https://speech.api.cloud.yandex.net/speech/v1/stt:recognize" \
# #   #   -H "Authorization: Bearer $token" \
# #   #   -H "Content-Type: application/octet-stream" \
# #   #   -d @"$1")

#   # Проверить код ответа
# if [[ $(echo $response | jq -r '.code') != 200 ]]; then
#     echo "Ошибка: сайт вернул код ответа $(echo $response | jq -r '.code')."
   
# fi

#   # Получить распознанный текст
# recognized_text=$(echo $response | jq -r '.result')

#   # Сохранить распознанный текст в текстовый файл
# echo "$recognized_text" > ruAlisatext.txt

# echo "Распознанный текст сохранен в файл output.txt."


#!/bin/bash

# Функция синтеза речи
#!/bin/bash

# # Задайте идентификатор каталога и IAM-токен
# FOLDER_ID="b1glg8l1kni6p8eqp5au"
# IAM_TOKEN="t1.9euelZqdz8-Unc2ak5WMzY7HnprOi-3rnpWansbOx8eNnZ7LnJeVm5iRjMjl8_d6dm1N-e9DJXlO_d3z9zola03570MleU79zef1656VmsmVx5iYj5yVl5uWkZiPnpCM7_zN5_XrnpWayJGPlpWaycaKmcyam5yTlsvv_cXrnpWayZXHmJiPnJWXm5aRmI-ekIw.AIqppyxg0xOZiv7R60EL6lznLMUZJi8m8eWJmEBLI_Ed_l5yY1m89fPLtBz8Q3qC7Fg_BvNVEdFJBwBZwiMUBQ"

# # Считайте содержимое OGG-файла
# data=$(cat ruAlisaspeech.ogg)

# # Сформируйте параметры запроса
# params="topic=general&folderId=$FOLDER_ID&lang=ru-RU"

# # Сформируйте URL-адрес запроса
# url="https://stt.api.cloud.yandex.net/speech/v1/stt:recognize?$params"

# # Установите заголовок авторизации
# header="Authorization: Bearer $IAM_TOKEN"

# # Отправьте запрос
# response=$(curl -s -H "$header" -d "$data" "$url")

# # Извлеките ответ в формате JSON
# decodedData=$(echo "$response" | jq -r '.')

# # # Проверьте наличие ошибок
# # if [ "$(decodedData.error_code)" == "null" ]; then
# #   # Выведите результат распознавания
# #   echo "${decodedData.result}"
# # fi

# echo $decodedData

FOLDER_ID="b1glg8l1kni6p8eqp5au" # Идентификатор каталога
IAM_TOKEN="t1.9euelZqdz8-Unc2ak5WMzY7HnprOi-3rnpWansbOx8eNnZ7LnJeVm5iRjMjl8_d6dm1N-e9DJXlO_d3z9zola03570MleU79zef1656VmsmVx5iYj5yVl5uWkZiPnpCM7_zN5_XrnpWayJGPlpWaycaKmcyam5yTlsvv_cXrnpWayZXHmJiPnJWXm5aRmI-ekIw.AIqppyxg0xOZiv7R60EL6lznLMUZJi8m8eWJmEBLI_Ed_l5yY1m89fPLtBz8Q3qC7Fg_BvNVEdFJBwBZwiMUBQ" # IAM-токен
AUDIO_FILE="ruAlisaspeech.ogg" # Имя аудиофайла

# Отправка запроса к Yandex Speech Kit
RESPONSE=$(curl -X POST -H "Authorization: Bearer $IAM_TOKEN" -F "file=@$AUDIO_FILE" -F "topic=general" -F "folderId=$FOLDER_ID" -F "lang=ru-RU" "https://stt.api.cloud.yandex.net/speech/v1/stt:recognize")

# Проверка наличия ошибок в ответе
ERROR_CODE=$(echo "$RESPONSE" | jq -r '.error_code')
if [[ "$ERROR_CODE" == "null" ]]; then
    # Получение распознанного текста
    RESULT=$(echo "$RESPONSE" | jq -r '.result')
    echo "$RESULT"
else
    echo "Ошибка при распознавании речи: $ERROR_CODE"
fi
