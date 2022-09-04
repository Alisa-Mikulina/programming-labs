#!/bin/bash


export LANG=en_US.UTF-8


count_directories=0
count_files=0


tree_extractor () {
	count_directories=$((count_directories + 1))
	local parent=$1
	local prefix=$2
	local children=($parent/*)
	local children_count=${#children[@]}
	
	
	if [[ ! -z "`ls $1`" ]]
	then
		for i in "${!children[@]}"
		do
			local child=${children[$i]}
			child=${child##*/}
			
			
			local nester_pattern="│   "
			local arrow_pattern="├── "
			
			
			if [ $i -eq $((children_count - 1)) ]
			then
				arrow_pattern="└── "
				nester_pattern="    "
			fi
			
			
			echo "${prefix}${arrow_pattern}$child"
			
			
			if [ -d "$parent/$child" ]
			then
				tree_extractor "$parent/$child" "${prefix}$nester_pattern"
			else
				count_files=$((count_files + 1))
			fi
		done
	fi
}


root="."
if [ "$#" -ne 0 ]
	then root="$1"
fi
echo $root


tree_extractor $root ""


echo


if [ "${count_directories: -1}" = "2" ]
then
	printf "$(($count_directories - 1)) directory, "
else
	printf "$(($count_directories - 1)) directories, "
fi


if [ "$count_files" -eq "1" ]
then
	echo "$count_files file"
else
	echo "$count_files files"
fi




