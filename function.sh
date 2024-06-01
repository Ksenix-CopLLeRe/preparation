# function msg {
#     echo "Аргумент: $1"
# }

# msg $1

function sum_two {
    echo $(($1 + $2))
    return  2
}

a=200
b=57
result=`sum_two $a $b`
echo "Статус завершения функции сложения: $?"
echo "Результат сложения $a и $b: $result"
