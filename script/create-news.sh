#!/bin/bash

echo -e "\n== Creating a new news page\n"

read -p "Enter publishing date (format YYYY-MM-DD, press ENTER for today's date): "
DATE=${REPLY:-`date +%Y-%m-%d`}
read -p "Enter title: "
TITLE=${REPLY:-News title}
read -p "Enter image filename (press ENTER for default image): "
IMAGE=${REPLY:-default.png}

CONTENT="---\ntitle: $TITLE\ndate: $DATE\nimage: /news/$IMAGE\ndescription: \"Short intro text\"\n---\n\nMain text"
FILENAME="_news/$DATE-$TITLE.md"
echo -e $CONTENT > "$FILENAME"

echo -e "\nNews page created: $FILENAME\n"
