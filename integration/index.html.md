---
title: Mercaux integration

language_tabs:
  - xml
  - json
  - csv

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
Mercaux also supports flawless integration with common product feed standards such as [Google product feed](https://support.google.com/merchants/answer/188494?hl=en), [YML](https://yandex.ru/support/partnermarket/yml/about-yml.xml) or [Amazon product feed](https://images-na.ssl-images-amazon.com/images/G/01/rainier/help/XML_Documentation_Intl.pdf).

# Product feed

```xml

<offers>
      <offer id="example_sku" title="Jeans">
        <ecomUrl>http://example-store.com/path/to/the/product</url>
        <price>12.00</price>
        <oldprice>15.50</oldprice>
        <currencyId>EUR</currencyId>
        <categoryId>547</categoryId>
        <picture>http://example-store.com/path/to/image/1.jpg</picture>
        <picture>http://example-store.com/path/to/image/2.jpg</picture>
        <vendor>Vendor name</vendor>
        <model>model_code</model>
        <param name="Color">Blue</param>
        <param name="Size" unit="INT">L</param>
        <param name="Fabric">100% Cotton</param>
        <param name="Gender">Female</param>
      </offer>
      ...
</offers>

```

```json

{
  "products" : [ {
    "ean" : "barcode,
    "category" : "category_code"
    "price" : {
    	"currency" : "EUR",
    	"value" : "12.00",
    	"old_value" : "15.50"
    },
    "ecom_url" : "http://example-store.com/path/to/the/product",
    "sku" : "example_sku",
    "title" : "Jeans",
    "subtitle" : "Exmaple subtitle",
    "sizes" : [ {
    		"size" : "M",
    		"barcode" : "example_barcode_1"
    	},{
    		"size" : "L",
    		"barcode" : "example_barcode_2"
    	}    	
    ]
    "images" : [
    	"http://example-store.com/path/to/image/1.jpg",
    	"http://example-store.com/path/to/image/2.jpg"
    ],
    "color" : "Blue",
    "fabric" : "100% Cotton",
    "description" : "Example description"
  	}, ...
  ]
}

```

See below the list of required and optional parameters:

Parameter | Required | Comment
--------- | -------- | -------
sku | yes |
category_id | yes | ID from the catalogue tree or unique name
name | yes | Main product title
color | yes | One color or array of colors, at least one required
size | yes | One size or array of sizes
barcode | yes | One barcode or array of barcodes associated with sizes
price | yes | We support different prices for differens countries
old_price | no | Price before discounts
short_description | no | Can be used as a subtitle
description | no |
model | no | Model code, usually a part of SKU
gender | no |
brand | no |
season | no |
collection | no |
wave | no |
supplier | no |
fabric | no |
ecom_url | no |
additional_attributes | no | For example tags or additional categories

