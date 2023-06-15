const fs = require("fs");

//  Converts a UTC timestamp (20240815T160000Z) to a CET string (2024-08-15 18:00)
const convertDateTime = (dateTimeString) => {
  const dt0 = dateTimeString.replace(/^(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})Z$/, "$1-$2-$3T$4:$5:$6Z")
  const dt1 = new Date(Date.parse(dt0));
  return dt1.toLocaleString('sv-SE', { 
    timeZone: 'CET',
    dateStyle: 'short',
    timeStyle: 'short'
  });
} 

// Iterate events in the file and convert start_time and end_time
fs.readFile("./_data/gbif-org-events.json", "utf8", (_err, jsonString) => {

  const data = JSON.parse(jsonString);
  
  data.VCALENDAR[0].VEVENT.forEach(event => {
    event.start_time = convertDateTime(event.start_time);
    event.end_time = convertDateTime(event.end_time);
  });

  fs.writeFileSync('./_data/gbif-org-events.json', JSON.stringify(data, null, 2))
});
