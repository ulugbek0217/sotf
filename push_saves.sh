#!/bin/bash


cd /root/sotf_server/game/userdata
git_status=$(git status | awk '/Changes not/ {printf "changed"}')

#container = $(docker ps -a --format "{{.Names}}" | grep -i "sons")
#if [ -n $ ]; then
#    echo "running"
#    docker stop container
#else
#    echo "stopped, pushing..."
#    cd /root/sotf_server/game/userdata/
#
#fi

if [[ $git_status == "changed" ]]; then
    git add .
    git commit -m "$(date "+%d/%m/%Y %H:%M")"
    git push origin main
fi

if [[ $? != 0 ]]; then
    echo -e "\e[31mCouldn't push saves\e[0m"
else
    echo -e "\e[32mPushed to github!\e[0m"
fi
#container=$(docker ps -a --format "{{.Names}}" | grep -i "sons")
#echo "$container"
