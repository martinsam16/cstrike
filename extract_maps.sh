#!/usr/bin/env bash

for file in $(pwd)/opt/hlds/cstrike/maps/*
do
    if [[ -f $file ]]; then
        filename=$(basename -- $file)
        filename=${filename%%.*}
        maps+="$filename "
    fi
done

declare -A uniq
for k in $maps ; do uniq[$k]=1 ; done

if [ -z "${USE_VOTEMAP}" ]; then
    printf '%s\n' ${!uniq[@]} | sort > /opt/hlds/cstrike/addons/amxmodx/configs/maps.ini    
fi
printf '%s\n' ${!uniq[@]} | sort > /opt/hlds/cstrike/mapcycle.txt
