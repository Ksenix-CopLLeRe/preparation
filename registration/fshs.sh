function check_login {
    login=$1
    db_name=$2
    separator=$3

    for line in $(cat $db_name)
    do
        if [[ $line == $login$separator* ]]
        then
            echo $line
            return 1
        fi
    done
}

function hash_password {
    echo $password | sha256sum | awk '{print $1}'
}

function capture_intruder {
    photos_directory=intruders
    if [[ ! -d $photos_directory ]]
    then
        mkdir $photos_directory
    fi

    today=$(date)

    ffmpeg -i /dev/video0 -t 1 "$photos_directory/intruder_$today.png" 1> /dev/null 2> /dev//null
}