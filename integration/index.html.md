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

Mercaux API has paging enabled. You may get 206 (Partial Content) code back with only partial content and "X-MercauxPagingData" header set.

That means you need to make another request with same URL, providing this header back as is to get next data portion.

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

