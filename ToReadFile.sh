#!/bin/bash

while IFS= read -r filepath
do
    echo "$filepath"
done < forloop.sh
