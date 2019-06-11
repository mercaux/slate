---
title: Public API Reference

language_tabs:
  - shell

includes:
  - results

search: true
---

# Introduction

Welcome to the Mercaux Public API! You can use this API to access Looks, Alternatives, Recommendations etc.

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> Make sure to replace `XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX` with your API key.

Mercaux uses API keys to allow access to the API. You will need to ask your Mercaux manager to get one.

API expects the API key to be included in all API requests to the server in a header that looks like the following:

`X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX`

# Paging

> To get first portion of data, just use normal request as described in documentation.

```shell
curl "api_endpoint_here"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```
> To get all next portions of data, add `X-MercauxPagingData` header. Copy it intact from previous response. 

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
  -H "X-MercauxPagingData: pagingData"
```

> Make sure to replace `XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX` with your API key.

> Make sure to replace `pagingData` with data from previous response.

Mercaux API has paging enabled. You may get 206 (Partial Content) code back with only part of content in response and "X-MercauxPagingData" header set.

That means you need to make another request with same URL, providing this header back as is to get next data portion.

# Difs

> Some requests support difs (they can return only changes which happen after specific time). To use this functionality you should add a header and use the returned one from the previous update. Time is in UTC. Format is "2019-10-20.10:20:30". To get all the data (for the first time), just use normal request as described in documentation.

```shell
curl "api_endpoint_here"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> To get dif, add `X-MercauxAPITimestamp` header. Copy it intact from previous response. 

```shell
curl "api_endpoint_here"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
  -H "X-MercauxAPITimestamp: yyyy-mm-dd.hh:mm:ss"
```

> Make sure to replace `XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX` with your API key.

> Make sure to replace `X-MercauxAPITimestamp` with data from previous response.

> Make sure to use the same timestamp for all the paging requests (while you get 206 response).

# Throttling

Mercaux API will reject your request if you access API too often. You will get `429 (Too Many Requests)` result code.
Default throttling value is 4 requests per minute for one API key. There are two exceptions from this rule.

### Request throttling and paging

All consequent paging requests are treated as one request and so not throttled.

### Request throttling and images

After you request some (for example) looks, all corresponding images become available for download (only once) without throttling.

# API Key Requests

## Reset API Key

```shell
curl "https://api.mercaux.com/1.0/apikey/reset"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": "XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
}
```

This endpoint returns new API Key. The old one will stop working in a minute.

### HTTP Request

`GET https://api.mercaux.com/1.0/apikey/reset`

# Data Requests

## Get Looks

```shell
curl "https://api.mercaux.com/1.0/api/look/"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
# OR
curl "https://api.mercaux.com/1.0/api/look/?query=some_text_query"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id" : "1",
      "likesCount" : "2",
      "name" : "Look 1",
      "imageName" : "/1.0/api/look/image/pic.jpg",
      "products" : [
        {
          "sku" : "PRODUCT123",
          "uniqueId" : "123456"
        },
        {
          "sku" : "PRODUCT1234"
        }
      ],
      "badges" : [
        {
          "name" : "Super Badge",
          "filename" : "/1.0/api/badge/image/pic.jpg"
        }
      ],
      "tags" : [
        {
          "tag" : "super",
          "text" : "Super Tag"
        }
      ],
      "createdBy" : [
         {
           "languageCode" : "en",
           "text" : "Alex"
         },
         {
           "languageCode" : "ru",
           "text" : "Алексей"
         }
      ],
      "createdOn" : "2016-06-07.07:54:58",
      "updatedOn" : "2016-06-07.07:54:58",
      "status" : "active",
      "digital" : false,
      "lookType" : "signature",
      "previewImageName" : "/1.0/api/look/preview/pic.jpg",
      "secondaryPreviewImageNames" : [
        {
          "filename" : "/1.0/api/look/preview/pic2.jpg",
          "weight" : 400
        },
        {
          "filename" : "/1.0/api/look/preview/pic3.jpg",
          "weight" : 399
        }
      ]
    },
    {
      "id" : "2",
      "likesCount" : "3",
      "name" : "Look 2",
      "imageName" : "/1.0/api/look/image/pic33.jpg",
      "products" : [
        {
          "sku" : "PRODUCT2123",
          "uniqueId" : "2123456"
        },
        {
          "sku" : "PRODUCT21234"
        }
      ],
      "createdBy" : [
         {
           "languageCode" : "en",
           "text" : "Alex"
         },
         {
           "languageCode" : "ru",
           "text" : "Алексей"
         }
      ],
      "createdOn" : "2016-06-07.07:54:58",
      "updatedOn" : "2016-06-07.07:54:58",
      "status" : "awaiting_approval",
      "digital" : true,
      "lookType" : "ordinary",
      "previewImageName" : "/1.0/api/look/preview/pic4.jpg",
      "secondaryPreviewImageNames" : [
        {
          "filename" : "/1.0/api/look/preview/pic22.jpg",
          "weight" : 400
        },
        {
          "filename" : "/1.0/api/look/preview/pic33.jpg",
          "weight" : 399
        }
      ]
    }
  ]
}
```

This endpoint retrieves all looks (if query is empty) or looks satisfying the query (if not empty).

### HTTP Request

`GET https://api.mercaux.com/1.0/api/look/?query=<query>`

### URL Parameters

Parameter | Description
--------- | -----------
query | Text query to filter looks (optional)

### Images

Every look contains layout image and may contain preview images (primary and several secondary ones).
To get these images you should use this API, e.g. if provided image path is `/1.0/api/look/image/pic33.jpg` 
you should access it with `https://api.mercaux.com/1.0/api/look/image/pic33.jpg` URL. 
See below for these Image request details.

### Text constants

Some json fields have predefined values. Here's the list:

* Status: active, awaiting_approval, rejected
* Look type : ordinary, signature, operational, social, customer

## Get look layout image

```shell
curl "https://api.mercaux.com/1.0/api/look/image/<imageName>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns `303 See Other` result code and redirect location to Amazon CDN. 
> The redirect link is valid at least 30 seconds after it was generated.

This endpoint retrieves an layout image with given name.
It always return `303 See Other` result code and redirect location to Amazon CDN in `Location` header.
All popular network libraries are able to automatically follow this redirect and get the image (if exists).

### HTTP Request

`GET https://api.mercaux.com/1.0/api/look/image/<imageName>`

### URL Parameters

Parameter | Description
--------- | -----------
imageName | image name

### Redirect URL

This request will always provide you with URL redirect to. That's a signed Amazon CDN URL, which is valid for a short amount of time.
Normally it will be valid for 30-60 seconds. You should start your image download before it is expired, however you may continue your download 
even if link is already expired. To re-download the image later, use this API url to generate new redirect.

## Get look preview image

```shell
curl "https://api.mercaux.com/1.0/api/look/preview/<imageName>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns `303 See Other` result code and redirect location to Amazon CDN. 
> The redirect link is valid at least 30 seconds after it was generated.

This endpoint retrieves an layout image with given name.
It always return `303 See Other` result code and redirect location to Amazon CDN in `Location` header.
All popular network libraries are able to automatically follow this redirect and get the image (if exists).

### HTTP Request

`GET https://api.mercaux.com/1.0/api/look/preview/<imageName>`

### URL Parameters

Parameter | Description
--------- | -----------
imageName | image name

### Redirect URL

This request will always provide you with URL redirect to. That's a signed Amazon CDN URL, which is valid for a short amount of time.
Normally it will be valid for 30-60 seconds. You should start your image download before it is expired, however you may continue your download 
even if link is already expired. To re-download the image later, use this API url to generate new redirect.

## Get look badge image

```shell
curl "https://api.mercaux.com/1.0/api/badge/image/<imageName>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns `303 See Other` result code and redirect location to Amazon CDN. 
> The redirect link is valid at least 30 seconds after it was generated.

This endpoint retrieves an layout image with given name.
It always return `303 See Other` result code and redirect location to Amazon CDN in `Location` header.
All popular network libraries are able to automatically follow this redirect and get the image (if exists).

### HTTP Request

`GET https://api.mercaux.com/1.0/api/badge/image/<imageName>`

### URL Parameters

Parameter | Description
--------- | -----------
imageName | image name

### Redirect URL

This request will always provide you with URL redirect to. That's a signed Amazon CDN URL, which is valid for a short amount of time.
Normally it will be valid for 30-60 seconds. You should start your image download before it is expired, however you may continue your download 
even if link is already expired. To re-download the image later, use this API url to generate new redirect.

## Get Alternatives

```shell
curl "https://api.mercaux.com/1.0/api/alternative/"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id" : "1", 
      "sku" : "SR12345", 
      "alternativeSku" : "SR43212",
      "uniqueId" : "12345", 
      "alternativeUniqueId" : "54321",
      "criterion" : "manual"
    },
    {
      "id" : "2", 
      "sku" : "SR12346", 
      "alternativeSku" : "SR43213",
      "alternativeUniqueId" : "543211",
      "criterion" : "manual"
    },
    {
      "id" : "3", 
      "sku" : "SR12347", 
      "alternativeSku" : "SR43214",
      "uniqueId" : "123425",
      "criterion" : "manual"
    },
    {
      "id" : "3", 
      "sku" : "SR12347", 
      "alternativeSku" : "SR43214",
      "criterion" : "manual"
    }
  ]
}
```

This endpoint retrieves all alternatives.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/alternative/`

### Criteria

Alternative criterion is one of the  following types:

* manual

## Get Recommendation

```shell
curl "https://api.mercaux.com/1.0/api/recommendation/"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id" : "1", 
      "sku" : "SR12345", 
      "recommendedSku" : "SR43212",
      "uniqueId" : "12345", 
      "recommendedUniqueId" : "54321",
      "criterion" : "manual"
    },
    {
      "id" : "2", 
      "sku" : "SR12346", 
      "recommendedSku" : "SR43213",
      "recommendedUniqueId" : "543211",
      "criterion" : "manual"
    },
    {
      "id" : "3", 
      "sku" : "SR12347", 
      "recommendedSku" : "SR43214",
      "uniqueId" : "123425",
      "criterion" : "manual"
    },
    {
      "id" : "3", 
      "sku" : "SR12347", 
      "recommendedSku" : "SR43214",
      "criterion" : "manual"
    }
  ]
}
```

This endpoint retrieves all recommendations.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/recommendation/`

### Criteria

Recommendation criterion is one of the  following types:

* manual
* Look <LookName> (one criterion for each look)

## Get Products

```shell
curl "https://api.mercaux.com/1.0/api/product/?<different params, see below>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "baseSku" : "sku123",
      "sku" : "sku1",
      "additionalSku" : ["sku2", "sku3"],
      "barcode" : "123456789",
      "additionalBarcode" : ["123","456","789"],
      "model" : "model1",
      "title" : "Shirt",
      "size" : {
         "id" : "2",
         "type" : "general",
         "grid" : "US",
         "name" : "XL",
         "sizeInt" : "12"
      },
      "colour" : {
         "id" : "1",
         "group" : "red",
         "name" : "soft red"
      },
      "fabric" : {
         "part" : {
            "id" : "3",
            "name" : "body"
         },
         "material" : {
            "id" : "4",
            "name" : "cotton"
         },
         "percent" : "100%"
      },
      "wave" : {
         "id" : "5",
         "name" : "Winter2019"
      },
      "brand" : {
         "id" : "6",
         "name" : "Nike"
      },
      "badge" : {
         "id" : "42",
         "name" : "SuperBadge",
         "storeCluster" : "UK",
         "store" : "London Airport",
         "storeUniqueId" : "GB_LA_12"
      },
      "category" : [
         {
            "id" : "7",
            "name" : "Boys > Shoes > Awesome shoes"
         }
      ],
      "interview" : [
         {
            "id" : "8",
            "name" : "Gender > Neutral"
         }
      ],
      "collection" : {
         "id" : "9",
         "name" : "Classics"
      },
      "description" : "Some very long description.",
      "shortDescription" : "Short description that is really shorter then description.",
      "season" : {
         "id" : "10",
         "name" : "Winter"
      },
      "supplier" : {
         "id" : "11",
         "name" : "Shady supplier"
      },
      "primaryImage" : "image2.jpg",
      "secondaryImage" : ["image.jpg", "image3.jpg"],
      "colourPreviewImage" : ["image4.jpg"],
      "price" : [
         {
            "id" : "12",
            "priceType" : "base",
            "storeCluster" : "Underground",
            "salePrice" : 1.0,
            "retailPrice" : 2.0
         }
      ]
    }
  ]
}
```

This endpoint retrieves products for specific params.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/product/?<various params>`

### URL Parameters

Parameter | Description
--------- | -----------
language | Language to use for entities which have translations (example: en) (required)
baseSkus | Filter products by base skus (multiple allowed, optional)
skus | Filter products by skus (multiple allowed, optional)
brands | Filter products by brand names (multiple allowed, optional)
supplier | Filter products by supplier name (optional)
catalogCategoryIds | Filter products by ids of their categories (multiple allowed, optional)
catalogCategories | Filter products by category names (multiple allowed, optional)
interviewCategoryIds | Filter products by ids of their interview categories (multiple allowed, optional)
interviewCategories | Filter products by interview category names (multiple allowed, optional)
seasons | Filter products by season names (multiple allowed, optional)
collections | Filter products by collection names (multiple allowed, optional)
wave | Filter products by wave name (optional)
fabrics | Filter products by fabric names (multiple allowed, optional)
colours | Filter products by colour names (multiple allowed, optional)
sizes | Filter products by size names (multiple allowed, optional)
badges | Filter products by badge names (multiple allowed, optional)
query | Text query to filter products (optional)
withImages | If true, get only products which have at least one image, if false, get only products without any image (optional)
withInventory | If true, get only products which are present in stores, if false, get only products which are not present in stores (optional)
pushed | Get only pushed (if true) or not pushed (if false) products (optional)
onlyWithoutLooks | Get only products without any look (if true) or all products otherwise (if false or not present) (optional)
onlyWithoutBadges | Get only products without any badges (if true) or all products otherwise (if false or not present) (optional)
onlyWithoutAlts | Get only products without any alternatives (if true) or all products otherwise (if false or not present) (optional)
onlyWithoutRecs | Get only products without any recommendations (if true) or all products otherwise (if false or not present) (optional)
currency | Used together with price filters, specifies currency so only prices with that currency is used for filtering (optional)
minRetailPrice | Keep products with retail price greater or equal to this value (optional)
maxRetailPrice | Keep products with retail price less or equal to this value (optional)
minSalePrice | Keep products with sale price greater or equal to this value (optional)
maxSalePrice | Keep products with sale price less or equal to this value (optional)
saleOnly | Keep only products which are on sale (optional)
productStatus | Filter products by product status (multiple allowed, optional)
country | Used together with both status filter and all content-based filters to specify where to check status and/or content availability; use country code here; also filters skus, uniqueIds, badges by this country (optional)
productPriceType | Used together with price filters, specifies currency so only prices with that currency is used for filtering (optional)

### Images

Every product may contain various images (primary and several secondary ones).
To get these images you should use this API, e.g. if provided image path is `/1.0/api/product/image/pic33.jpg` 
you should access it with `https://api.mercaux.com/1.0/api/product/image/pic33.jpg` URL. 
See below for these Image request details.

### Text constants

Some json fields have predefined values. Here's the list:

* Status: onSale, preSale, postSale, notAvailable

## Get All Products (with dif functionality)

```shell
curl "https://api.mercaux.com/1.0/api/product/dif/?<different params, see below>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
  -H "X-MercauxAPITimestamp: 2019-11-20.10:00:00"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "baseSku" : "sku123",
      "sku" : "sku1",
      "additionalSku" : ["sku2", "sku3"],
      "barcode" : "123456789",
      "additionalBarcode" : ["123","456","789"],
      "model" : "model1",
      "title" : "Shirt",
      "size" : {
         "id" : "2",
         "type" : "general",
         "grid" : "US",
         "name" : "XL",
         "sizeInt" : "12"
      },
      "colour" : {
         "id" : "1",
         "group" : "red",
         "name" : "soft red"
      },
      "fabric" : {
         "part" : {
            "id" : "3",
            "name" : "body"
         },
         "material" : {
            "id" : "4",
            "name" : "cotton"
         },
         "percent" : "100%"
      },
      "wave" : {
         "id" : "5",
         "name" : "Winter2019"
      },
      "brand" : {
         "id" : "6",
         "name" : "Nike"
      },
      "badge" : {
         "id" : "42",
         "name" : "SuperBadge",
         "storeCluster" : "UK",
         "store" : "London Airport",
         "storeUniqueId" : "GB_LA_12"
      },
      "category" : [
         {
            "id" : "7",
            "name" : "Boys > Shoes > Awesome shoes"
         }
      ],
      "interview" : [
         {
            "id" : "8",
            "name" : "Gender > Neutral"
         }
      ],
      "collection" : {
         "id" : "9",
         "name" : "Classics"
      },
      "description" : "Some very long description.",
      "shortDescription" : "Short description that is really shorter then description.",
      "season" : {
         "id" : "10",
         "name" : "Winter"
      },
      "supplier" : {
         "id" : "11",
         "name" : "Shady supplier"
      },
      "primaryImage" : "image2.jpg",
      "secondaryImage" : ["image.jpg", "image3.jpg"],
      "colourPreviewImage" : ["image4.jpg"],
      "price" : [
         {
            "id" : "12",
            "priceType" : "base",
            "storeCluster" : "Underground",
            "salePrice" : 1.0,
            "retailPrice" : 2.0
         }
      ]
    }
  ]
}
```

This endpoint retrieves products for specific params.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/product/dif/?<various params>`

### URL Parameters

Parameter | Description
--------- | -----------
language | Language to use for entities which have translations (example: en) (required)
country | Used together with both status filter and all content-based filters to specify where to check status and/or content availability; use country code here; also filters skus, uniqueIds, badges by this country (optional)

### Images

Every product may contain various images (primary and several secondary ones).
To get these images you should use this API, e.g. if provided image path is `/1.0/api/product/image/pic33.jpg` 
you should access it with `https://api.mercaux.com/1.0/api/product/image/pic33.jpg` URL. 
See below for these Image request details.

### Text constants

Some json fields have predefined values. Here's the list:

* Status: onSale, preSale, postSale, notAvailable

## Get product image

```shell
curl "https://api.mercaux.com/1.0/api/product/image/<imageName>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns `303 See Other` result code and redirect location to Amazon CDN. 
> The redirect link is valid at least 30 seconds after it was generated.

This endpoint retrieves an layout image with given name.
It always return `303 See Other` result code and redirect location to Amazon CDN in `Location` header.
All popular network libraries are able to automatically follow this redirect and get the image (if exists).

### HTTP Request

`GET https://api.mercaux.com/1.0/api/product/image/<imageName>`

### URL Parameters

Parameter | Description
--------- | -----------
imageName | image name

### Redirect URL

This request will always provide you with URL redirect to. That's a signed Amazon CDN URL, which is valid for a short amount of time.
Normally it will be valid for 30-60 seconds. You should start your image download before it is expired, however you may continue your download 
even if link is already expired. To re-download the image later, use this API url to generate new redirect.

## Get Inventory (with dif functionality)

```shell
curl "https://api.mercaux.com/1.0/api/inventory/?<different params, see below>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
  -H "X-MercauxAPITimestamp: 2019-11-20.10:00:00"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "sku" : "sku1",
      "additionalSku" : ["sku2", "sku3"],
      "barcode" : "123456789",
      "additionalBarcode" : ["123","456","789"],
      "store" : "London Airport",
      "storeUniqueId" : "GB_LA_12",
      "quantity" : 12,
      "stockQuantity" : 5
    }
  ]
}
```

This endpoint retrieves inventory for specific params.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/inventory/?<various params>`

### URL Parameters

Parameter | Description
--------- | -----------
language | Language to use for entities which have translations (example: en) (required)
country | Used to filter stores for inventory and sku's and uniqueId's

## Get Analytics event names

```shell
curl "https://api.mercaux.com/1.0/api/analytics/raw/eventName?language=<language code>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id" : "100",
      "eventName" : "Scan barcode",
      "translatedEventName" : "Scan barcode",
      "subEvents" : [
         {
            "name" : "none",
            "translatedName" : "none"
         }
      ]
    }
  ]
}
```

This endpoint retrieves event names for analytics translated to specific language.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/analytics/raw/eventName?language=<language code>`

### URL Parameters

Parameter | Description
--------- | -----------
language | Language to use for entities which have translations (example: en) (required)

## Get raw analytics

```shell
curl "https://api.mercaux.com/1.0/api/analytics/raw/?<different params, see below>"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "timestamp" : "2019-10-20.10:20:30",
      "date" : "2019-10-20",
      "time" : "10:20:30",
      "store" : "Main Plaza",
      "storeUniqueId" : "MP124",
      "event" : "Scan barcode",
      "eventId" : "100",
      "productSku" : "sku123",
      "fullCatalogPath" : [
         "Boys > Shoes > Awesome shoes"
      ],
      "firstLevelCategory" : ["Boys"],
      "secondLevelCategory" : ["Shoes"],
      "variantSku" : "sku1",
      "variantUniqueId" : "1234124124",
      "sizes" : "L, XL",
      "colours" : "Red, Blue",
      "user" : "Admin",
      "userLogin" : "support@mercaux.com",
      "role" : "Mercaux",
      "country" : "Uganda",
      "duplicateUniqueId" : ["21341234123", "4234123412341"],
      "duplicateSku" : ["sku2", "sku3"]
    }
  ]
}
```

This endpoint retrieves raw analytics for specific params.

### HTTP Request

`GET https://api.mercaux.com/1.0/api/analytics/raw/?<various params>`

### URL Parameters

Parameter | Description
--------- | -----------
language | Language to use for entities which have translations (example: en) (required)
defaultLanguage | Fallback language to use for entities which have translations but there's no translation for the previously specified language (example: en) (required)
start | The start of the time interval (ex: 2019-10-20.10:20:30, required)
end | The end of the time interval (ex: 2019-10-20.10:20:30, required)
eventIds | Filter events by ids (multiple allowed, optional)
eventSubtypes | Filter events by subtypes (multiple allowed, optional)
storeUniqueIds | Filter by store unique ids (multiple allowed, optional)
versions | Filter by app versions (multiple allowed, optional)
appTypes | Filter by app types (multiple allowed, optional)
userRoles | Filter by user role names (multiple allowed, optional)
hoursShift | Alter timestamps in response (to correspond not to UTC time, optional)

### Text constants

Some json fields have predefined values. Here's the list:

* appType: ios, iphone, ipad, portal, android, androidTablet, androidPhone, androidBigScreen, mobile

# Miscellaneous requests

## Get current time

```shell
curl "https://api.mercaux.com/1.0/misc/time"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": "2016-08-12.10:47:52"
}
```

This endpoint retrieves current time.

### HTTP Request

`GET https://api.mercaux.com/1.0/misc/time`

## Get current API version

```shell
curl "https://api.mercaux.com/1.0/misc/version"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
```

> The above command returns JSON structured like this:

```json
{
  "data": "1.0.11"
}
```

This endpoint retrieves current version.

### HTTP Request

`GET https://api.mercaux.com/1.0/misc/version`
