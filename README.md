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

### Create a purchase

``POST /purchases``

##### Input

| Name             | Type                     | Description                                        |
|------------------|--------------------------|----------------------------------------------------|
| client           | int                      | The ID of the customer who made the purchase.      |
| description      | string                   | A brief description of the purchase.               |
| purchase_details | List of Purchase Details | Each Purchase Detail represents one purchase item. |

###### Purchase Detail model

| Name     | Type | Description                      |
|----------|------|----------------------------------|
| product  | int  | The ID of the product purchased. |
| quantity | int  | The amount of items purchased.   |

##### Example

```json
{
  "client": 1,
  "description": "A brief description ...",
  "purchase_details": [
    {
      "product": 1,
      "quantity": 2
    },
    {
      "product": 3,
      "quantity": 5
    }
  ]
}
```

##### Response

```bash
Status: 201 Created
```

```json
{
  "id": 1,
  "description": "A brief description ...",
  "total": "750.50",
  "client_id": 1,
  "created_at": "2017-05-19T00:30:42.000Z",
  "updated_at": "2017-05-19T00:30:42.000Z",
  "purchase_details": [
    {
      "id": 1,
      "quantity": 2,
      "product_id": 1,
      "created_at": "2017-05-19T00:30:42.000Z",
      "updated_at": "2017-05-19T00:30:42.000Z"
    },
    {
      "id": 2,
      "quantity": 5,
      "product_id": 3,
      "created_at": "2017-05-19T00:30:42.000Z",
      "updated_at": "2017-05-19T00:30:42.000Z"
    }
  ]
}
```

### Get a single purchase

``GET /purchases/3``

##### Response

```bash
Status: 200 OK
```

```json
{
  "id": 3,
  "description": "3 ZenBooks 3",
  "total": "25499.97",
  "client_id": 3,
  "created_at": "2017-05-17T01:03:06.000Z",
  "updated_at": "2017-05-17T01:03:06.000Z",
  "purchase_details": [
    {
      "id": 4,
      "quantity": 3,
      "product_id": 3,
      "created_at": "2017-05-17T01:03:06.000Z",
      "updated_at": "2017-05-17T01:03:06.000Z"
    }
  ]
}
```

### Update a purchase

``PUT /purchases/3``

The input must follow the same structure of the [creation service](https://github.com/vicenteneto/purchases#create-a-purchase).

##### Response

```bash
Status: 204 No content
```

### Update a purchase

``DELETE /purchases/3``

##### Response

```bash
Status: 204 No content
```
