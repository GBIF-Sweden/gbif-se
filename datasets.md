---
layout: base
title: Datasets
---

# {{ page.title }}

<script src="https://unpkg.com/tablefilter@0.6.109/dist/tablefilter/tablefilter.js"></script>

<table id="datasetstable">
    <thead>
        <tr>
            <th>Title</th>
            <th>Organization</th>
            <th data-sort-method="number">Record count</th>
            <th>Type</th>
            <th>Source</th>
            <th>Keyword</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script>
function populate_table(datasets) { // Main filterable table
    //console.log('apa')
    //console.log(document.getElementById('datasets'))
  var tableRef = document.getElementById('datasetstable').getElementsByTagName('tbody')[0];
  console.log(tableRef)
  datasets.forEach(result => {
    newRow = tableRef.insertRow();

    // Note that trying to embed html closing tags here breaks when shown in Vortex
    var tdTitle = document.createElement('td');
    var anch = Object.assign(document.createElement('a'), {href: "https://gbif.org/dataset/" + result['key'], textContent: result['title']});
    tdTitle.appendChild(anch);
    newRow.appendChild(tdTitle);
    newRow.appendChild(Object.assign(document.createElement('td'), {textContent: result['publishingOrganizationTitle']}));
    newRow.appendChild(Object.assign(document.createElement('td'),{id:result['key'], className:'table-number', textContent:parseInt(result['recordCount']).toLocaleString('en-GB')}));
    newRow.appendChild(Object.assign(document.createElement('td'), {textContent: result['type']}));
    newRow.appendChild(Object.assign(document.createElement('td'), {textContent: result['hostingOrganizationTitle']}));
    var keyword = '';
    
    if('keywords' in result) {
      if(result['keywords'].includes('citizen-science') || result['keywords'].includes('citizen science')) { 
          keyword = 'citizen-science';
        } else if(result['keywords'].includes('private-sector') || result['keywords'].includes('private sector')) {
          keyword = 'private-sector';
        } else if(result['keywords'].includes('musit-norway') || result['keywords'].includes('musit norway')) {
          keyword = 'musit-norway';
        }
    }
    newRow.appendChild(Object.assign(document.createElement('td'), {textContent: keyword}));
  });
}

var getOtherDatasetCounts = async(datasets) => {
    for(var res of datasets) {
        if('recordCount' in res && res['type'] != 'CHECKLIST') { continue; }
        var count = 0;
        if(res['type'] == 'OCCURRENCE' || res['type'] == 'SAMPLING_EVENT') {
            const d_response = await fetch('https://api.gbif.org/v1/occurrence/count?datasetKey=' + res['key'])
            count = await d_response.json();
        } else if(res['type'] == 'CHECKLIST') {
            const d_response = await fetch('https://api.gbif.org/v1/dataset/' + res['key'] + '/metrics')
            var response = await d_response.json();
            count = response['countByOrigin']['SOURCE'];
        }
        var cellRef = document.getElementById(res['key']);
        cellRef.innerHTML = parseInt(count).toLocaleString('en-GB');
        res['recordCount'] = count;
    }
}

const pageLoad = async () => {
    try {
        const ds_response = await fetch('https://api.gbif.org/v1/dataset/search?publishingCountry=SE&limit=500');
        var dataset_results = await ds_response.json();
        datasets = dataset_results['results'];
        console.log(datasets);
    } catch(err) {
        datasets = cache;
    }
    await populate_table(datasets);

    var tf = new TableFilter(document.getElementById("datasetstable"), {
      base_path: "https://unpkg.com/tablefilter@0.6.109/dist/tablefilter/",
      alternate_rows: true,
      col_types: ['string', 'string', 'number', 'string', 'string', 'date', 'date'],
      col_1: 'select',
      col_2: 'none',
      col_3: 'select',
      col_4: 'select',
      col_5: 'select',
      clear_filter_text: '- All -',
      extensions: [{ name: 'sort' }]
    });
    tf.init();

    await getOtherDatasetCounts(datasets);

    // Have to reinitialise the table so sort by count is correct
    tf.init();
}
pageLoad();
</script>
