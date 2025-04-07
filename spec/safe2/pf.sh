#!/bin/bash

# Loop through all files in the current directory
for file in *; do
  # Check if the current item is a file
  if [ -f "$file" ]; then
    # Create a temporary file to store the lines we want to keep
    temp_file=$(mktemp)

    # Extract the first line and the line containing the partial match
    head -n 1 "$file" >> "$temp_file"
    grep -E "~ More in <a href=\"https://weboftrust.github.io/WOT-terms" "$file" >> "$temp_file"

    # Replace the original file with the content of the temporary file
    cat "$temp_file" > "$file"

    # Remove the temporary file
    rm "$temp_file"

    echo "Processed file: $file"
  fi
done

echo "All files processed."
