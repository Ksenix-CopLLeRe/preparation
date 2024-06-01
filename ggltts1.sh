#!/bin/bash

# Установите переменную с текстовым файлом, который вы хотите преобразовать в речь.
text_file="input.txt"

# Проверьте, существует ли текстовый файл.
if [ ! -f "$text_file" ]; then
  echo "Указанный текстовый файл ($text_file) не существует."
  exit 1
fi

# Получите ключ API Google Cloud Text-to-Speech.
# Вам необходимо создать учетную запись Google Cloud и включить API Text-to-Speech, чтобы получить ключ API.
api_key="YOUR_API_KEY"

# Установите переменную с именем выходного аудиофайла.
output_file="output.mp3"

# Синтезируйте речь с помощью Google Cloud Text-to-Speech.
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $api_key" \
  -d "{\"input\":{\"text\":\"$(cat $text_file)\"},\"voice\":{\"languageCode\":\"ru-RU\",\"ssmlGender\":\"FEMALE\"},\"audioConfig\":{\"audioEncoding\":\"MP3\"}}" \
  "https://texttospeech.googleapis.com/v1beta1/text:synthesize" \
  -o "$output_file"

# Проверьте, был ли синтезирован аудиофайл.
if [ ! -f "$output_file" ]; then
  echo "Не удалось синтезировать аудиофайл."
  exit 1
fi

# Воспроизведите синтезированный аудиофайл с помощью предустановленного проигрывателя.
play "$output_file"
