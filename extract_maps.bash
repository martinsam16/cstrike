#!/usr/bin/env bash

declare -a maps

for file in /opt/hlds/cstrike/maps/*
do
    if [[ -f $file ]]; then
        filename=$(basename -- $file)
        filename=${filename%%.*}
        maps+=("$filename ")
    fi
done

declare -A uniq

for k in $maps ; do uniq[$k]=1 ; done

if [ -z "${USE_VOTEMAP}" ]; then
    printf '%s\n' ${!uniq[@]} | sort > /opt/hlds/cstrike/addons/amxmodx/configs/maps.ini    
fi

printf '%s\n' ${!uniq[@]} | sort > /opt/hlds/cstrike/mapcycle.txt

echo "Maps added :D"