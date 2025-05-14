---
title: "Introducing Biodiversity Data Cubes: A new way to access and analyze GBIF data"
date: 2025-05-14
image: 2025-05-14-Introducing_Biodviersity_Data_Cubes.png
description: "A new service developed by GBIF.org introduces Biodiversity Data Cubes, offering a powerful and flexible way to access and analyze species occurrence data using SQL-based queries."
---

Traditionally, downloading occurrence data from GBIF has involved retrieving full datasets based on filters like species, location or date. With Biodiversity Data Cubes (or B-CUBEs), users can now request summarized, multidimensional tables—known as data cubes—that condense occurrence records into counts across customizable combinations of dimensions, such as species, time, and location.

This innovation makes it easier for users to ask complex questions, such as:
- How many observations of birds in Sweden have been recorded per year since 2000?
- What are the most frequently observed species across protected areas in Europe?
- How does the number of insect records vary seasonally across different biomes?

These queries can be answered efficiently through a simple API that supports SQL-based access to pre-aggregated data cubes. For example, a single API call can return a table with species counts by year and country, making it ideal for biodiversity trend analysis, reporting, and integration into scientific workflows.

## Benefits and use cases
- Scalability and speed: Queries return compact summaries rather than full datasets, significantly reducing download size and processing time.
- Flexibility: Users can define the exact structure of the cube, selecting the dimensions that matter most to their analysis.
- Integration: The API can be easily integrated into R, Python or other analytical workflows, supporting reproducible research.

## Try it out
You can explore the service and example queries on GBIF’s developer pages:  
[GBIF Occurrence Cube Service documentation](https://www.gbif.org/developer/occurrence#cube)

The service is currently in public beta, and feedback is welcome from researchers, developers, and policy analysts interested in scalable biodiversity data analysis.
