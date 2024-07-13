const fs = require("fs");

// Iterate records in the file and fetch record count if missing
fs.readFile("./_data/datasets-se.json", "utf8", (_err, jsonString) => {

  const data = JSON.parse(jsonString);
  
  data.results.forEach(dataset => {
    dataset.recordCountFormatted = parseInt(dataset.recordCount).toLocaleString('en-GB');
  });

  fs.writeFileSync('./_data/datasets-se.json', JSON.stringify(data, null, 2))
});
