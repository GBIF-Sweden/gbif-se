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
            <th>Type</th>
            <th data-sort-method="number">Record count</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script>

const populateTable = (records) => {
    const tableBody = document.getElementById('datasetstable').getElementsByTagName('tbody')[0];
    records.forEach(record => {
        const newRow = tableBody.insertRow();
        const tdTitle = document.createElement('td');
        tdTitle.appendChild(Object.assign(document.createElement('a'), 
            {href: 'https://gbif.org/dataset/' + record['key'], textContent: record['title']}));
        newRow.appendChild(tdTitle);
        newRow.appendChild(Object.assign(document.createElement('td'), {textContent: record['publishingOrganizationTitle']}));
        newRow.appendChild(Object.assign(document.createElement('td'), {textContent: record['type']}));
        newRow.appendChild(Object.assign(document.createElement('td'), 
            {className:'table-number', textContent:parseInt(record['recordCount']).toLocaleString('en-GB')}));
    });
}

const getMissingRecordCounts = async(records) => {
    for (var record of records) {
        if (!'recordCount' in record || record['type'] == 'CHECKLIST') { 
            var count = 0;
            if (record['type'] == 'OCCURRENCE' || record['type'] == 'SAMPLING_EVENT') {
                const response = await fetch('https://api.gbif.org/v1/occurrence/count?datasetKey=' + record['key'])
                count = await response.json();
            } else if (record['type'] == 'CHECKLIST') {
                const response = await fetch('https://api.gbif.org/v1/dataset/' + record['key'] + '/metrics')
                const json = await response.json();
                count = json['countByOrigin']['SOURCE'];
            }
            record['recordCount'] = count;
        }
    }
}

const pageLoad = async() => {
    const response = await fetch('https://api.gbif.org/v1/dataset/search?publishingCountry=SE&limit=500');
    const json = await response.json();
    const records = json['results'];

    await getMissingRecordCounts(records);
    await populateTable(records);

    const tf = new TableFilter('datasetstable', {
        base_path: 'https://unpkg.com/tablefilter@0.6.109/dist/tablefilter/',
        alternate_rows: true,
        col_types: ['string', 'string', 'string', 'number'],
        col_1: 'select',
        col_2: 'select',
        col_3: 'none',
        clear_filter_text: '- All -',
        extensions: [{ name: 'sort' }]
    });
    tf.init();
}

pageLoad();

</script>
