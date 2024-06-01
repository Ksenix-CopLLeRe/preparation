#!/bin/bash

# Установите переменную с именем звукового файла.
audio_file="convertedFile.wav"

# Проверьте, существует ли звуковой файл.
if [ ! -f "$audio_file" ]; then
  echo "Указанный звуковой файл ($audio_file) не существует."
  exit 1
fi

# Установите путь к программе распознавания речи.
# В этом примере используется программа Vosk, которую необходимо установить отдельно.
vosk_path="/usr/local/bin/vosk"

# Распознайте речь в звуковом файле с помощью Vosk.
text=$(echo "$(cat $audio_file | $vosk_path recognize --model=vosk-model-ru --language=ru)" | jq -r '.text')

# Проверьте, был ли распознан текст.
if [ -z "$text" ]; then
  echo "Не удалось распознать текст в звуковом файле."
  exit 1
fi

# Выведите распознанный текст.
echo "$text"
