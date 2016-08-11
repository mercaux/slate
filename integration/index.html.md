---
title: Mercaux integration

language_tabs:
  - XML, JSON, CSV

search: false
---

# Introduction

Mercaux uses four basic data sets:

1. Catalogue structure (categories tree)
2. List of products with descriptions (name, description, attributes, prices etc.) and their categories
3. Product images (identified by product id in name or path to the image)
4. Inventory (usually the list of tuples storeId + productId + quantity)

We support any of the data export formats (json, XML, csv) via shared folder (for example regular export to SFTP folder) or our integration with your existing external API. 


# Product feed


Parameter | Required | Comment
--------- | -------- | -------
sku | yes |
category_id | yes |
name / title | yes |
description | no |
brand | no |
season | no |
collection | no |
wave | no |
fabric | no |
colors | yes | Array of colors, required at least one
sizes | yes | Array of sizes with barcodes