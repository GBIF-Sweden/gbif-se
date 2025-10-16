// This script adds and updates events from the gbif.org calendar feed (gbif-org-events.json)
// to the repo file (all-events.json). The purpose is to be able to keep past events as the
// gbif.org calendar feed only contain upcoming events.
// Events are removed when they are older than two years.

const fs = require("fs");
const util = require("util");

const getExistingEvent = (uid) => {
  for (var event of allEvents) {
    if (event.uid == uid) {
      return event;
    }
  }
  return undefined;
}

const gbifCurrentEvents = JSON.parse(fs.readFileSync("./_data/gbif-org-events.json", "utf8"));
const allEvents = JSON.parse(fs.readFileSync("./_data/all-events.json", "utf8"));

// Loop through gbif.org upcoming events and add or update events
gbifCurrentEvents.VCALENDAR[0].VEVENT.forEach(event => {
  const existingEvent = getExistingEvent(event.uid);
  if (existingEvent === undefined) {
    allEvents.push(event)
    console.log('Added: ' + event.title)
  } else if (!util.isDeepStrictEqual(event, existingEvent)) {
    allEvents[allEvents.indexOf(existingEvent)] = event;
    console.log('Updated: ' + event.title)
  }
});

// Remove events older than two years
const now = new Date();
const lastValidDate = new Date(now.getFullYear() - 2, now.getMonth(), now.getDate());
const result = allEvents.filter(event => event.end_time >= lastValidDate.toISOString());

// Write the updated events back to all-events.json
fs.writeFileSync('./_data/all-events.json', JSON.stringify(result, null, 2))
