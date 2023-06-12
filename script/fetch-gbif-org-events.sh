#!/bin/bash

echo "Fetching events from gbif.org..."

# Fetch events from gbif.org to _data/gbif-org-events.ics
curl -sS "https://api.gbif.org/v1/newsroom/events/calendar/upcoming.ics?limit=100" --output _data/gbif-org-events.ics

# Convert to json, output file is _data/gbif-org-events.json (requires nodejs)
if test -f "node_modules/ical2json/bin/ical2json"; then
    ICAL2JSON="node_modules/ical2json/bin/ical2json"
else
    ICAL2JSON="ical2json"
fi
$ICAL2JSON _data/gbif-org-events.ics

# Replace attribute names to align with our own data model for events
sed -i 's/SUMMARY/title/g' _data/gbif-org-events.json
sed -i 's/DESCRIPTION/description/g' _data/gbif-org-events.json
sed -i 's/URL/url/g' _data/gbif-org-events.json
sed -i 's/DTSTART/start_time/g' _data/gbif-org-events.json
sed -i 's/DTEND/end_time/g' _data/gbif-org-events.json

# Convert iso timestamps to YYYY-MM-DD HH:MM format
# TODO:mb handle timezones
sed -i -E 's/([0-9]{4})([0-9]{2})([0-9]{2})T([0-9]{2})([0-9]{2})[0-9]{2}Z/\1-\2-\3 \4:\5/g' _data/gbif-org-events.json
# Convert linebreaks
sed -i 's/\\\\n\\\\n/<br class=\\"mb-4\\">/g' _data/gbif-org-events.json
# Cleanup
sed -i 's/\\\\n//g' _data/gbif-org-events.json
sed -i 's/\\\\//g' _data/gbif-org-events.json

echo "Done"
