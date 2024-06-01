# trap "echo ' Ha-haarr!'" SIGINT

# for ((i=0;i<10;i++))
# do
#     echo "Итерация №$i"
#     sleep 1
# done 

time=30
trap "echo ' Меня нельзя убить!'" SIGTERM

for ((i=0;i<$time;i++))
do
    echo "Итерация №$i"
    sleep 1
done 