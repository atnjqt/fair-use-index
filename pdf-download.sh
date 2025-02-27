#/bin/bash

# Author: Etienne Jacquot
# Date: 02/26/2025

# create a directory to store the PDFs
mkdir -p pdfs

# loop through each URL in urls.txt and sleep 10 seconds between each download to prevent hitting the govt server too frequently
while read -r url; do
    echo "Downloading PDF from $url"
    # get the filename as split on the last / and take the last element
    filename=$(echo $url | rev | cut -d'/' -f1 | rev)
    # check if the filename already exists in the .pdfs directory, if it does, skip!
    if [ -f "./pdfs/$filename" ]; then
        echo "File already exists, skipping..."
        continue
    fi
    echo "Filename: $filename"
    # download the PDF
    curl $url -o "./pdfs/$filename"
    sleep 10
done < urls.txt