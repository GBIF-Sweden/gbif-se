#!/bin/bash

echo -e "\n== Creating a new news page\n"

read -p "Enter publishing date (format YYYY-MM-DD, press ENTER for today's date): "
DATE=${REPLY:-`date +%Y-%m-%d`}
read -p "Enter title: "
TITLE=${REPLY:-News title}
read -p "Enter image filename (press ENTER for default image): "
IMAGE=${REPLY:-gbif-logo.png}

CONTENT="---\ntitle: \"$TITLE\"\ndate: $DATE\nimage: $IMAGE\ndescription: \"Short intro text\"\n---\n\nMain text"

FILETITLE=${TITLE//\\/-}
FILETITLE=${FILETITLE//\//-}
FILETITLE=${FILETITLE//\*/-}
FILETITLE=${FILETITLE//\:/-}
FILETITLE=${FILETITLE//\!/-}
FILETITLE=${FILETITLE//\?/-}
FILENAME="_news/$DATE-$FILETITLE.md"

echo -e $CONTENT > "$FILENAME"

echo -e "\nNews page created: $FILENAME\n"

code --reuse-window "$FILENAME"
