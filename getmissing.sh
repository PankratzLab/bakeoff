#!/bin/bash

group1=()
while IFS=  read -r -d $'\0'; do
   group1+=("$REPLY")
done < <(find group1/ -type d -name "NWD*" -print0)

for i in "${group1[@]}"; do
    if [[ -z $(find ${i}/ -name "NWD*.FINAL.vcf.gz.tbi") ]]; then
        echo "Missing ${i}/NWD*.FINAL.vcf.gz.tbi"
        echo $(basename ${i}) >> unfinished.txt
    fi
done

group2=()
while IFS=  read -r -d $'\0'; do
   group2+=("$REPLY")
done < <(find group2/ -type d -name "NWD*" -print0)

for i in "${group2[@]}"; do
    if [[ -z $(find ${i}/ -name "NWD*.FINAL.vcf.gz.tbi") ]]; then
        echo "Missing ${i}/NWD*.FINAL.vcf.gz.tbi"
        echo $(basename ${i}) >> unfinished2.txt
    fi
done