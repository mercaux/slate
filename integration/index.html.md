---
title: Mercaux integration

language_tabs:
  - XMLs 
  - JSON
  - CSV

search: false
---

# Introduction

Mercaux uses four basic data sets:

1. Catalogue structure (categories tree)
2. List of products with descriptions (name, description, attributes, prices etc.) and their categories
3. Product images (identified by product id in name or path to the image)
4. Inventory (usually the list of tuples storeId + productId + quantity)

<aside class="notice">
We support any of the data export formats (JSON, XML, CSV, XLS) via shared folder (for example regular export to SFTP folder) or integration with your existing API. 
</aside>

# Product feed


Parameter | Required | Comment
--------- | -------- | -------
sku | yes |
category_id | yes | ID from the catalogue tree or unique name
name | yes | Main product title
colors | yes | Array of colors, at least one required
sizes | yes | Array of sizes with barcodes
short_description | no | Can be used as a subtitle
description | no |
brand | no |
season | no |
collection | no |
wave | no |
supplier | no |
fabric | no |
ecom_url | no |

<aside class="success">
Mercaux supports flawless integration with common product feed standards such as 
</aside>