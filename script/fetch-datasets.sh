#!/bin/bash

# Exit on errors
set -e

echo "Fetching datasets from gbif.org..."

# Fetch and decorate datasets
curl -sS --max-time 30 --retry 1 "https://api.gbif.org/v1/dataset/search?publishingCountry=SE&limit=500" --output _data/datasets-se.json
node ./script/decorate-datasets.js

echo "Done"
