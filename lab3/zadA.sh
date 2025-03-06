#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Zadanie 10.
# Proszę określić, ile w katalogu `dane/icao/` jest unikalnych plików,
# rozumianych jako niepowtarzalne zaalokowanie zawartości na dysku twardym
# (to znaczy: kilka dowiązań twardych do tego samego pliku traktujemy jako 1).
# Jako wynik wyświetlić po prostu samą liczbę, nic więcej.
#

DIR="dane/icao"

declare -A inodes

for file in "$DIR"/*; do
    if [[ -f "$file" ]]; then
        inode=$(stat -c "%i" "$file")
        inodes["$inode"]=1
    fi
done

count=${#inodes[@]}

echo "$count"
