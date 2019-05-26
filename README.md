# Carbtographer
Application that recommends macro friendly meals from local restaurants.

[![CodeFactor](https://www.codefactor.io/repository/github/reynld/carbtographer/badge/master)](https://www.codefactor.io/repository/github/reynld/carbtographer/overview/master)
[![Go Report Card](https://goreportcard.com/badge/github.com/reynld/carbtographer)](https://goreportcard.com/report/github.com/reynld/carbtographer)

# Backend
Link: https://api.carbtographer.com

## Enviroment Variables
You will require a Yelp API Key to make authenticated requests.
Locally ran Postgress and Redis server to test locally
 
You can generate one following the intructions here: [Creating an app on Yelp's Developers site](https://www.yelp.com/developers/documentation/v3/authentication)
- ``PORT``- your server PORT
- ``YELP_API`` - your Yelp Key (API Key)
- ``DB_HOST`` - your database Host URL
- ``DB_PORT``- your database PORT
- ``DB_USER`` - your database user
- ``DB_NAME`` - your database name
- ``DB_PASSWORD`` - your database password
- ``ENVIROMENT`` - must be PRO or DEV
- ``JWT_KEY`` - jwt secret key
- ``CACHE_ADDRS`` - redis server address
- ``CACHE_PASSWORD`` - redis server password
- ``CACHE_DB`` - redis databse number


## Run locally

#### Enable go modules
`export GO111MODULE=on`

#### Scrape Info
`go run main.go -scrape`

#### Run migrations
`go run main.go -migrate`
 
#### Run Postgress seeds
 `go run main.go -seed`

#### Run Redis seeds
 `go run main.go -seed-cache`
 
#### Run server
 `go run main.go -serve`

<br/>

## ENDPOINTS

#### GET `/`
 
```
{
    status: 200,
    message: "server live on port: ####"
}
```
<br/>

#### GET `/names`

Returns all restaurant names in database
 
```
[
    {
        id: 1
        name: "Name"
    }
]
```
<br/>

#### GET `/locations/{lat}/{lon}`
 
Returns restaurant info based on lat and long
 
`lat`: latitude  
`lon`: longitude  
 
```
[
  {
    "id": "id",
    "name": "Name",
    "coordinates": {
      "latitude": 0.0,
      "longitude": 0.0
    },
    "photos": [
      "url"
    ],
    "distance": 20.0
  }
]
```
<br/>

#### GET `/items/{id}`

Returns all items for any given restaurant ID
 
`id`: restaurant ID  
 
```
[
    {
        "id": 0,
        "name": "item name",
        "type": "type",
        "protein": 0,
        "carbs": 0,
        "fats": 0,
        "calories": 0,
        "calperpro": 0.0
        "sodium": 0,
        "r_id": 0
    }
]
```
<br/>

#### GET `/*`
 
404 Endpoint
 
```
{
    status: 404,
    message: "route not found"
}
```
