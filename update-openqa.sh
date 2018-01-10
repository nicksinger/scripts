#!/bin/bash

oqaBase="/var/lib/openqa/share/tests"

# use find to ignore symlinks
for codebase in $(find $oqaBase -maxdepth 1 -type d ! -path $oqaBase); do
    echo Updating codebase $codebase:
    git -C $codebase pull
    for product in $(find $codebase -type d -name ".git" ! -path "$codebase/.git"); do
        echo -e "\tFound needles in: $product - updating:"
        git -C "$codebase" pull
    done
    echo -e "=== Codebase $codebase done ===\n"
done
