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

fs.writeFileSync('./_data/all-events.json', JSON.stringify(allEvents, null, 2))
