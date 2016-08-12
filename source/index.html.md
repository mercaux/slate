---
title: Public API Reference

language_tabs:
  - shell

toc_footers:
  - For a Developer ApiKey contact your Mercaux manager
  - <a href='https://github.com/tripit/slate'>Documentation Powered by  Slate</a>

includes:
  - errors

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

# API Key Requests

## Reset API Key

```shell
curl "https://api.mercaux.com/apikey/reset"
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

`GET https://api.mercaux.com/apikey/reset`

# Data Requests

## Get Looks


```shell
curl "https://api.mercaux.com/api/look/"
  -H "X-MercauxApikey: XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX"
# OR
curl "https://api.mercaux.com/api/look/?query=some_text_query"
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
      "imageName" : "/look/image/pic.jpg",
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
          "filename" : "/badge/image/pic.jpg"
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
      "previewImageName" : "/look/preview/pic.jpg",
      "secondaryPreviewImageNames" : [
        {
          "filename" : "/look/preview/pic2.jpg",
          "weight" = 400
        },
        {
          "filename" : "/look/preview/pic3.jpg",
          "weight" = 399
        }
      ]
    },
    {
      "id" : "2",
      "likesCount" : "3",
      "name" : "Look 2",
      "imageName" : "/look/image/pic33.jpg",
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
      "previewImageName" : "/look/preview/pic4.jpg",
      "secondaryPreviewImageNames" : [
        {
          "filename" : "/look/preview/pic22.jpg",
          "weight" = 400
        },
        {
          "filename" : "/look/preview/pic33.jpg",
          "weight" = 399
        }
      ]
    }
  ]
}
```

This endpoint retrieves all looks (if query is empty) or looks satisfying the query (if not empty).

### HTTP Request

`GET https://api.mercaux.com/api/look/?query=<query>`

### URL Parameters

Parameter | Description
--------- | -----------
query | Text query to filter looks (optional)

