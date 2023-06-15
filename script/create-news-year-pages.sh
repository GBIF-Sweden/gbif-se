#!/bin/bash

# Find all unique years that have news published
YEAR_COUNT=`ls _news | cut -c 1-4 | sort -u -r | wc -l` 
YEARS=`ls _news | cut -c 1-4 | sort -u -r | head -n 5`

# Create archive page if more than five years
if [ $YEAR_COUNT -gt 5 ]; then
    YEARS="$YEARS archive"
fi

echo Creating index pages for the years: $YEARS

truncate -s 0 _data/news-years.yml
for YEAR in $YEARS; do
    # Add to years data file
    echo "- $YEAR" >> _data/news-years.yml
    # Create index page
    CONTENT="---\nlayout: news-list\nyear: $YEAR\ntitle: News $YEAR\npermalink: /news/$YEAR/\n---"
    echo -e $CONTENT > pages/news-$YEAR.html
done

echo Done
