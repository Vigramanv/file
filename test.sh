#!/usr/bin/bash
end_of_file=0
while [[ $end_of_file == 0 ]]; do
    read -r line
    # #set -f # avoid globbing (expansion of *).
    # echo ${array[0]}
    # for i in "${!array[@]}"; do
    #     echo "$i=>${array[i]}"
    # done
    # the last exit status is the
    # flag of the end of file
    end_of_file=$?
    read -a strarr <<<"$line"
    for val in "${strarr[@]}"; do
        ((++i))
        sleep 0.2
        echo "$i:$val"
        TEST=`curl -X POST http://styleplusbackend.myntra.com/api/styleplus/v1/user/fraud-user-update -H 'Accept: */*' -H 'userid: $val'`
        echo $TEST
        RESPONSE=$($TEST)
        echo " $RESPONSE"
    done
done <"$1"
