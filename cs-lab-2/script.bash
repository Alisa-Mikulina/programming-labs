#!/bin/bash

a=$1
b=$2

if [[ $b -eq 0 ]] 
then
    echo -n $((a + b)) $((a - b)) $((a * b)) '#'
else
    if [[ $((a / b)) -eq 0 ]]
    then
            if [[ a -eq 0 ]]
            then
                echo $((a + b)) $((a - b)) $((a * b)) 0.00
            else
                if [[ a -lt 0 ]] && [[ b -ge 0 ]]
                then 
                    echo -n $((a + b)) $((a - b)) $((a * b)) -0
                    echo $((100 * -a / b)) | sed -e 's/..$/.&/;t' -e 's/.$/.0&/'
                elif [[ b -lt 0 ]] && [[ a -ge 0 ]]
                then
                    echo -n $((a + b)) $((a - b)) $((a * b)) -0
                    echo $((100 * a / -b)) | sed -e 's/..$/.&/;t' -e 's/.$/.0&/'
                else
                    echo -n $((a + b)) $((a - b)) $((a * b)) 0
                    echo $((100 * a / b)) | sed -e 's/..$/.&/;t' -e 's/.$/.0&/'
                fi
            fi
    else
        echo $((a + b)) $((a - b)) $((a * b)) $((100 * a / b)) | sed -e 's/..$/.&/;t' -e 's/.$/.0&/'
    fi
fi
