#директория должна существовать
if [[ ! -d $1 ]] 
then
    echo "Директория не существует: $1"
    exit
fi


#файл с расширением должен существовать
if [[ ! -f $extensions_filename ]] 
then
    echo "Не найден файл с расширением для поиска"
    exit
fi

for file in $(ls $1) 
do
    for extensions in $(cat $extensions_filename)
    do
        if [[ $file == *.$extensions ]] 
        then
            echo "$file с расширением $extensions"
        fi
    done
done