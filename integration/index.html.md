---
title: Mercaux integration

language_tabs:
  - XML
  - JSON
  - CSV

search: false
---

# Introduction

Mercaux uses four basic data sets:

1. Catalogue structure (categories tree)
2. List of products with descriptions (name, description, attributes, prices etc.) and their categories
3. Product images (identified by product id in its name or path to the image)
4. Inventory (usually the list of tuples: store ID, product ID and quantity)

<aside class="notice">
We support any of the data export formats (JSON, XML, CSV, XLS) via shared folder (for example regular export to SFTP folder) or integration with your existing API. 
</aside>

# Product feed

```XML

<offers>
      <offer id="example_sku">
        <url>http://example-store.com/path/to/the/product</url>
        <price>12.00</price>
        <oldprice>15.50</oldprice>
        <currencyId>EUR</currencyId>
        <categoryId>547</categoryId>
        <picture>http://example-store.com/path/to/image/1.jpg</picture>
        <picture>http://example-store.com/path/to/image/2.jpg</picture>
        <vendor>Vendor name</vendor>
        <model>model_code</model>
        <param name="Color">Green</param>
        <param name="Size" unit="INT">L</param>
        <param name="Fabric">100% Cotton</param>
        <param name="Gender">Female</param>
      </offer>
      ...
</offers>

```

See below the list of required and optional parameters in feed:

Parameter | Required | Comment
--------- | -------- | -------
sku | yes |
category_id | yes | ID from the catalogue tree or unique name
name | yes | Main product title
colors | yes | Array of colors, at least one required
sizes | yes | Array of sizes with barcodes
short_description | no | Can be used as a subtitle
description | no |
model | no | Model code
gender | no |
brand | no |
season | no |
collection | no |
wave | no |
supplier | no |
fabric | no |
ecom_url | no |

<aside class="success">
Mercaux supports flawless integration with common product feed standards such as [Google product feed](https://support.google.com/merchants/answer/188494?hl=en), [YML (Yandex Market Language)](https://yandex.ru/support/partnermarket/yml/about-yml.xml), [Amazon product feed](https://images-na.ssl-images-amazon.com/images/G/01/rainier/help/XML_Documentation_Intl.pdf)
</aside>