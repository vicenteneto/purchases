# Purchases

## Overview

This describes the resources that make up the *Purchases* API. If you have any problems or requests please contact support.

## Schema

The API is accessed from the ``https://127.0.0.1:3000/v1``. All data is sent and received as JSON.

```json
curl -i https://127.0.0.1:3000/v1/clients

HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
ETag: W/"430a359c21e4c9ca0b156f36151a3e26"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dd953024-a42c-40c4-86bb-d48c9fac8094
X-Runtime: 0.069983
Transfer-Encoding: chunked

[
  {
    "id": 1,
    "first_name": "Vicente",
    "last_name": "Neto",
    "email": "sneto.vicente@gmail.com",
    "created_at": "2017-05-17T01:03:05.000Z",
    "updated_at": "2017-05-17T01:03:05.000Z"
  },
  {
    "id": 2,
    "first_name": "John",
    "last_name": "Lennon",
    "email": "john.lennon@beatles.com",
    "created_at": "2017-05-17T01:03:05.000Z",
    "updated_at": "2017-05-17T01:03:05.000Z"
  }
]
```

## Parameters

Some API methods take optional parameters. For GET requests, any parameters not specified as a segment in the path can be passed as an HTTP query string parameter:

``curl -i "http://127.0.0.1:3000/v1/purchases?description=cellphones"``

In this example, ``:description`` is passed in the query string.

## Root endpoint

The root endpoint for the *Purchases* API is:

``http://127.0.0.1:3000/v1``

## Purchases API

### Get all purchases

List all purchases, in the order that they were created on *Purchases*.

``GET /purchases``

##### Parameters

| Name        | Type   | Description                                             |
|-------------|--------|---------------------------------------------------------|
| description | string | Part of the description of the purchases to be searched |

##### Response

```bash
Status: 200 OK
```
```json
[
  {
    "id": 1,
    "description": "Description",
    "total": "1997.77",
    "client_id": 1,
    "created_at": "2017-05-17T01:03:06.000Z",
    "updated_at": "2017-05-17T02:57:41.000Z",
    "purchase_details": [
      {
        "id": 10,
        "quantity": 1,
        "product_id": 2,
        "created_at": "2017-05-17T02:57:41.000Z",
        "updated_at": "2017-05-17T02:57:41.000Z"
      }
    ]
  }
]
```
