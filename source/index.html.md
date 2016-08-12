---
title: Public API Reference

language_tabs:
  - shell

toc_footers:
  - For a Developer ApiKey contact your 
  - Mercaux manager
  - <a href='https://github.com/tripit/slate'>Documentation Powered by  Slate</a>

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

<aside class="notice">
You must replace <code>XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX</code> with your personal API key.
</aside>

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

# Throttling

Mercaux API will reject your request if you access API too often. You will get `429 (Too Many Requests)` result code.
Default throttling value is 3 requests per minute for one API key. There are two exceptions from this rule.

### Request throttling and paging

All consequent paging requests are treated as one request and so not throttled.

### Request throttling and images

After you request some looks, all corresponding images become available for download (only once) without throttling.

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
      "recommendedSku" : "SR43214"
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

  
