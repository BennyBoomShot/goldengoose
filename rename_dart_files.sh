#!/bin/bash

# Function to convert PascalCase to snake_case
to_snake_case() {
    echo "$1" | sed -E 's/([a-z0-9])([A-Z])/\1_\2/g' | tr 'A-Z' 'a-z'
}

# Loop through all .dart files in the current directory
for file in *.dart; do
    [[ -e "$file" ]] || continue

    # Use awk instead of grep -P (BSD-compatible)
    class_name=$(awk '/class / { for(i=1;i<=NF;i++) if($i=="class") print $(i+1); exit }' "$file" | sed 's/{.*//')

    if [ -n "$class_name" ]; then
        snake_case_name=$(to_snake_case "$class_name")
        new_filename="${snake_case_name}.dart"
        if [ "$file" != "$new_filename" ]; then
            echo "Renaming $file → $new_filename"
            mv "$file" "$new_filename"
        fi
    else
        echo "⚠️    No class found in $file"
    fi
done