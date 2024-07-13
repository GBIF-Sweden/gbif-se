#!/bin/bash

# Exit on errors
set -e

echo "Fetching datasets from gbif.org..."

# Fetch datasets
curl -sS --max-time 30 --retry 1 "https://api.gbif.org/v1/dataset/search?publishingCountry=SE&limit=500" --output _data/datasets-se.json

# Fetch record count if missing
node ./script/decorate-datasets.js

echo "Done"
