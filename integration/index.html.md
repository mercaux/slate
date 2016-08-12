---
title: Mercaux integration

language_tabs:
  - xml: XML
  - json: JSON
  - plaintext: CSV

search: false
---

# Integration intro

Mercaux uses four basic data sets:

1. Catalogue structure (categories tree)
2. List of products with descriptions (name, description, attributes, prices etc.) and their categories
3. Product images (identified by product id in its name or path to the image)
4. Inventory (usually the list of tuples: store ID, product ID and quantity)

<aside class="notice">
We support any of the data export formats (JSON, XML, CSV, XLS) via shared folder (for example regular export to SFTP folder) or integration with your existing API. 
</aside>
###Mercaux also supports flawless integration with common product feed standards such as [Google product feed](https://support.google.com/merchants/answer/188494?hl=en), [YML](https://yandex.ru/support/partnermarket/yml/about-yml.xml) or [Amazon product feed](https://images-na.ssl-images-amazon.com/images/G/01/rainier/help/XML_Documentation_Intl.pdf).


# Catalogue tree

> Example of the catalogue structure:

```xml

<categories>
	<category id="157">Female</category>
	<category id="158">Male</category>
	<category id="170" parentId="157">Shoes</category>
	...
</categories>

```

```json

{ "categories" : [ {
	"id" : "example_id_1",
	"name" : "Female",
	"subcategories" : [ {
		"id" : "exmaple_id_2",
		"name" : "Shoes",
		"subcategories" : []
		}, ...
	] 
	}, {
	"id" : "example_id_3",
	"name" : "Male",
	"subcategories" : [...] 
	}, ...	
] }

```

```plaintext

id,name,parent_id
157,Female,
158,Male,
170,Shoes,157

```

### See below the list of required and optional parameters:

Parameter | Required | Comment
--------- | -------- | -------
category_id | yes | Any kind of unique ID
name | yes | Category name
parent_id | yes/no | Required in case of plain structure
category_image | no | Icon or category cover from ecom
ecom_url | no |



# Product feed

> Example of the feed items:

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
        <param name="Size">L</param>
        <param name="Fabric">100% Cotton</param>
        <param name="Gender">Female</param>
      </offer>
      ...
</offers>

```

```json

{
  "products" : [ {
    "category" : "category_id",
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
    		"ean" : "example_barcode_1"
    	},{
    		"size" : "L",
    		"ean" : "example_barcode_2"
    	}    	
    ],
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

```plaintext

sku,category_id,name,color,size,barcode,price
"example_sku","category_id","Jeans","Blue","M","example_barcode_1","12.00"
"example_sku","category_id","Jeans","Blue","L","example_barcode_2","12.00"
...

```

> Product variants (sizes) can be stored as separate products (with parent sku field for example) or inside the product.
 

### See below the list of required and optional parameters:

Parameter | Required | Comment
--------- | -------- | -------
sku | yes |
category_id | yes | ID from the catalogue tree or unique name
name | yes | Main product title
color | yes | One color or array of colors, at least one required
size | yes | One size or array of sizes
barcode | yes | One barcode or array of barcodes associated with sizes
price | yes | We support different prices for differens countries
ecom_url | yes/no | Required in case of integration for omni
images | yes/no | Required if additional images feed/folder is not provided
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
additional_attributes | no | For example tags or additional categories

# Product images

###There are several options to let Mercaux download images:
* Directly from ecom or through public links
* From shared folder (for example SFTP or SharePoint folder)
* Via upload to Mercaux SFTP folder as an export process from internal storage systems

<aside class="notice">
Image name/path should contain some kind of product id which helps linking images to products and identifying primary ones.
</aside>

# Inventory

###Integrating with inventory levels requires two types of data sets:
* Stores list
* Inventory feed



##Stores list
Parameter | Required | Comment
--------- | -------- | -------
store_id | yes | Any type of unique ID
name | yes |
address | yes |
phone | no |
latitude | no |
longitude | no |
store_cluster | no | Optional grouping by store type


##Inventory feed

> Example of the inventory feed:

```xml

<inventory>
	<store id="example_store_id">
		<record productId="example_id_1">
			7
		</record>
		<record productId="example_id_2">
			3
		</record>
		...
	</store>
	...
</inventory>

```

```json

{ "inventory" : [ {
		"product_id" : "example_id_1",
		"store_id" : "example_store_id",
		"quantity" : 4,
		"stock_quantity" : 2
	}, {
		"product_id" : "example_id_2",
		"store_id" : "example_store_id",
		"quantity" : 3,
		"stock_quantity" : 1
	}, ...
] }

```

```plaintext

store_id,product_id,quantity
exmaple_store_id,example_product_id_1,6
exmaple_store_id,example_product_id_2,5
...

```

Parameter | Required | Comment
--------- | -------- | -------
store_id | yes |
product_id | yes | Full SKU, ID or pair of product SKU and size ID
quantity | yes |
stock_quantity | no | Mercaux supports sales floor / stock inventory separation
