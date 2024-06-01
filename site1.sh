#!/bin/bash

# Функция для распознавания речи из аудиофайла
function recognize_speech_from_file() {
  # Проверить, указан ли аудиофайл
  if [ $# -eq 0 ]; then
    echo "Ошибка: не указан аудиофайл для распознавания."
    return 1
  fi

  # Проверить, существует ли аудиофайл
  if [ ! -f "$1" ]; then
    echo "Ошибка: указанный аудиофайл не существует."
    return 1
  fi

  # Проверить, установлен ли браузер Google Chrome
  if ! command -v google-chrome &> /dev/null; then
    echo "Ошибка: браузер Google Chrome не установлен."
    return 1
  fi

  # Запустить браузер Google Chrome с флагом --enable-speech-recognition
  output=$(/usr/bin/google-chrome --enable-speech-recognition --no-sandbox --app="data:text/html,<script>window.onload = function () { var recognition = new webkitSpeechRecognition(); recognition.continuous = false; recognition.interimResults = false; recognition.lang = 'ru-RU'; var audio = new Audio(); audio.src = 'data:audio/wav;base64,$(base64 $1)'; audio.play(); recognition.start(); recognition.onresult = function (event) { document.body.textContent = event.results[0][0].transcript; }; };</script>" 2>&1)

  # Получить распознанную речь из вывода браузера
  recognized_speech=$(echo "$output" | sed -n '/interim results are final/,$p')

  # Остановить браузер Google Chrome
  killall google-chrome

  # Вывести распознанную речь
  echo "$recognized_speech"
}

recognized_speech=$(recognize_speech_from_file irlandman.wav)
echo "Распознанная речь: $recognized_speech"

