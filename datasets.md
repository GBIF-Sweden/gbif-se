---
layout: base
title: Datasets
load_tablefilter: true
---

# {{ page.title }}

<div class="mb-4 text-xl">
    <a href="https://gbif.se/ipt/">GBIF Sweden IPT</a>
</div>

<table id="datasetstable">
    <thead>
        <tr>
            <th>Title</th>
            <th>Organization</th>
            <th>Type</th>
            <th>Subtype</th>
            <th data-sort-method="number">Record count</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script>

const onPageLoad = async() => {

    records = await fetchRecords();
    populateTable(records);
    setupTableFilter();
}

const fetchRecords = async() => {
    const response = await fetch('https://api.gbif.org/v1/dataset/search?publishingCountry=SE&limit=500');
    const json = await response.json();
    const records = json['results'];

    for (var record of records) {
        await fetchRecordCountIfMissing(record);
    }

    return records;
}

const fetchRecordCountIfMissing = async(record) => {
    if (!'recordCount' in record || record['type'] == 'CHECKLIST') { 
        var count = 0;
        if (record['type'] == 'OCCURRENCE' || record['type'] == 'SAMPLING_EVENT') {
            const response = await fetch('https://api.gbif.org/v1/occurrence/count?datasetKey=' + record['key']);
            count = await response.json();
        } else if (record['type'] == 'CHECKLIST') {
            const response = await fetch('https://api.gbif.org/v1/dataset/' + record['key'] + '/metrics');
            const json = await response.json();
            count = json['countByOrigin']['SOURCE'];
        }
        record['recordCount'] = count;
    }
}

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
        newRow.appendChild(Object.assign(document.createElement('td'), {textContent: record['subtype']}));
        newRow.appendChild(Object.assign(document.createElement('td'), 
            {className:'table-number', textContent:parseInt(record['recordCount']).toLocaleString('en-GB')}));
    });
}

const setupTableFilter = () => {
    const tf = new TableFilter('datasetstable', {
        base_path: 'https://unpkg.com/tablefilter@0.7.3/dist/tablefilter/',
        alternate_rows: true,
        col_types: ['string', 'string', 'string', 'string', 'number'],
        col_1: 'select',
        col_2: 'select',
        col_3: 'select',
        col_4: 'none',
        clear_filter_text: '- All -',
        extensions: [{ name: 'sort' }]
    });
    tf.init();
}

onPageLoad();

</script>
