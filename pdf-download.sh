#/bin/bash

# Author: Etienne Jacquot
# Date: 02/26/2025

# Step 0. prompt user if they would like to proceed and download the PDFs from the US Govt Copyright Office Website
# include a disclaimer that the user is responsible for the use of this script and that they must abide by all terms of the Computer Fraud and Abuse Act
echo ""
echo "---------------------------------------------------------------------------"
# echo aacii art
echo '''
   __   ____________   __     ___  _______________   ___   ______  __________ 
  / /  / __/ ___/ _ | / /    / _ \/  _/ __/ ___/ /  / _ | /  _/  |/  / __/ _ \
 / /__/ _// (_ / __ |/ /__  / // // /_\ \/ /__/ /__/ __ |_/ // /|_/ / _// , _/
/____/___/\___/_/ |_/____/ /____/___/___/\___/____/_/ |_/___/_/  /_/___/_/|_|                                                                          
'''
echo "---------------------------------------------------------------------------"
echo ""
echo "                Copyright © 2025 Etienne Philippe Jacquot"
echo ""
sleep 1
echo ""
echo "   1. This script will download PDFs from the US Govt Copyright Office."
echo "   In running this script, you agree to abide by all terms of the US"
echo "   Computer Fraud and Abuse Act, in addition to all other applicable"
echo "   laws and regulations, including but not limited the US Copyright"
echo "   Act Legal Page here: https://www.copyright.gov/about/legal.html"
echo ""
sleep 1
echo "   2. Please be aware that the US Govt Copyright Office may have rate"
echo "   limiting, network monitoring, or other security measures in"
echo "   place to prevent misuse and abuse. Please be respectful of"
echo "   these measures and do NOT attempt to circumvent them."
echo ""
sleep 1
echo "   3. This script throttles requests to the US Govt Copyright Office"
echo "   to prevent abuse and misuse with 10 second intervals between"
echo "   each download (~6 downloads per minute). Please be patient" 
echo "   and do not attempt to modify or remove these intervals."
echo ""
sleep 1
echo "   4. You agree to:"
echo ""
echo "    - FULL RESPONSIBILITY WHEN USING THIS SCRIPT AND ANY DATA COLLECTED"
echo "    - COLLECT, USE, ANALYZE, AND SHARE DATA IN A LEGAL MANNER"
echo "    - DELETE ALL DATA COLLECTED AFTER NO LONGER NEEDED"
echo "    - NOT USE ANY DATA COLLECTED FOR COMMERCIAL OR GAINFUL PURPOSES"
echo "    - ONLY USE THE DATA COLLECTED FOR EDUCATIONAL PURPOSES"
echo "    - ALL TERMS IN THE LICENSE.md FILE INCLUDED IN THIS REPOSITORY"
echo ""
echo "---------------------------------------------------------------------------"
echo ""
sleep 1

read -p "  Do you agree to the terms and conditions outlined above? (yes/no): " response
if [ "$response" != "yes" ]; then
    echo "Exiting script..."
    echo "Please review the terms and conditions and rerun the script."
    exit 1
fi
sleep 1

echo ""
echo "  Thank you for agreeing to the legal terms and conditions!"
echo ""
echo "  Writing a timestamped log of your agreement to the ./agreed_terms/ folder"
echo ""
echo "---------------------------------------------------------------------------"


# Step 0.1. log the user's agreement to the terms and conditions
timestamp=$(date +%s)
current_datetime=$(date)
current_ipv4=$(curl -4 ifconfig.me -s)
current_ipv6=$(curl -6 ifconfig.me -s)
current_user=$(whoami)
current_host=$(hostname)
mkdir -p agreed_terms
echo "--------------------------------------------------" > ./agreed_terms/$timestamp.txt
echo "AGREED TO TERMS AND CONDITIONS" >> ./agreed_terms/$timestamp.txt
echo "--------------------------------------------------" >> ./agreed_terms/$timestamp.txt
echo "Datetime: $current_datetime" >> ./agreed_terms/$timestamp.txt
echo "Timestamp: $timestamp" >> ./agreed_terms/$timestamp.txt
echo "Hostname: $current_host" >> ./agreed_terms/$timestamp.txt
echo "Username: $current_user" >> ./agreed_terms/$timestamp.txt
echo "IPv4 Address: $current_ipv4" >> ./agreed_terms/$timestamp.txt
echo "IPv6 Address: $current_ipv6" >> ./agreed_terms/$timestamp.txt
echo "--------------------------------------------------" >> ./agreed_terms/$timestamp.txt
cat ./LICENSE.md >> ./agreed_terms/$timestamp.txt
echo "--------------------------------------------------" >> ./agreed_terms/$timestamp.txt

sleep 1

# Step 1. create a directory to store the PDFs
mkdir -p pdfs
pdf_count=0
# Step 2. loop through each URL in urls.txt and sleep 10 seconds between each download to prevent hitting the govt server too frequently

echo ""
echo "  Downloading PDFs from the US Govt Copyright Office..."
echo ""
echo "  Please be patient! This may take some time..."
echo ""

while read -r url; do
    #echo "Downloading PDF from $url"
    # get the filename as split on the last / and take the last element
    filename=$(echo $url | rev | cut -d'/' -f1 | rev)
    # check if the filename already exists in the .pdfs directory, if it does, skip!
    if [ -f "./pdfs/$filename" ]; then
        #echo "File already exists, skipping..."
        continue
        sleep 1
    fi
    echo "   Filename: $filename"
    # download the PDF
    curl $url -o "./pdfs/$filename" -s
    sleep 10
    # include a counter to determine how many PDFs have been downloaded
    pdf_count=$((pdf_count+1))
done < urls.txt
echo ""
echo "---------------------------------------------------------------------------"
echo ""
echo " --> Downloaded $pdf_count PDFs to the ./pdfs directory"
echo ""

echo "---------------------------------------------------------------------------"
echo ""

# Step 4. encourage the end user to manually inspect each PDF, as some may have failed to download properly, instructing them to delete and then rerun the script
echo "Please manually inspect each PDF in the ./pdfs directory for validity. If any are corrupt, delete them and rerun the script."
echo ""