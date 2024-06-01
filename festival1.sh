#!/bin/bash



# if [ ! -f "$text_file" ]; then
#   echo "Указанный текстовый файл ($text_file) не существует."
#   exit 1
# fi

# output_file="festival1.wav"


text2wave -o "festival8.wav" "exmpltextru.txt"
festival --tts "festival8.wav" 

# if [ ! -f "$output_file" ]; then
#   echo "Не удалось синтезировать аудиофайл."
#   exit 1
# fi


