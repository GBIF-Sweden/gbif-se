const fs = require("fs");

const fetch_json = async(url) => {
  const response = await fetch(url);
  return await response.json();
}

fs.readFile("./_data/datasets-se.json", "utf8", async (_err, jsonString) => {

  const data = JSON.parse(jsonString);
  
  for (var dataset of data.results) {

    // Fetch record count if missing
    if (!'recordCount' in dataset || dataset.recordCount == 0 || dataset.type == 'CHECKLIST') { 
      var count = 0;
      if (dataset.type == 'OCCURRENCE' || dataset.type == 'SAMPLING_EVENT') {
        //count = await fetch_json('https://api.gbif.org/v1/occurrence/count?datasetKey=' + dataset.key);
      } else if (dataset.type == 'CHECKLIST') {
        const result = await fetch_json('https://api.gbif.org/v1/dataset/' + dataset.key + '/metrics');
        count = result['countByOrigin']['SOURCE'];
      }
      dataset['recordCount'] = count;
    }

    // Formatting
    dataset.recordCountFormatted = parseInt(dataset.recordCount).toLocaleString('en-GB');
    dataset.url = 'https://www.gbif.org/dataset/' + dataset.key;
  }

  // Sort by title
  data.results.sort((a, b) => (a.title > b.title) ? 1 : ((b.title > a.title) ? -1 : 0));

  fs.writeFileSync('./_data/datasets-se.json', JSON.stringify(data, null, 2))
});
