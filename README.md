# Cars API


As an extension to our current backend infrastructure, we decided to create a car-sharing API to help us to show the best options around an user’s position.

In order to show cars on a map, all we need is a description and the position of the vehicle. And it is up to the api to organize different data sources and provide a single response via an endpoint.

## Instructions

The code challenge has to be implemented in **Ruby**. The web framework and libraries used are up to your choice.

Bear in mind that your solution should be scalable, so optimizations for better performance are a plus.

In this exercise, your job is to build a simple API/webservice that expose one single endpoint called `/cars` that receives a GET with the location parameter as the example below:

GET /cars?location=51.5444204,-0.22707

This endpoint should fetch the 10 closest cars from the database and return them ordered by distance from the point receive. See the following snippet of a valid response:

````json
{
    "cars": [
      {
        "description": "West Ealing - Hartington Rd",
        "latitude": 51.511318,
        "longitude": -0.318178
      },
      {
        "description": "Sudbury - Williams Way",
        "latitude": 51.553667,
        "longitude": -0.315159
      },
      {
        "description": "West Ealing - St Leonard’s Rd",
        "latitude": 51.512107,
        "longitude": -0.313599
      }
    ]
}
````

- You can use the file `data.json` as seed for your database
- We suggest you to save this content in a database, so you can sort and filter them easily.
- The endpoint should return the correct status codes for a success request and a failed one.
- Use this repository to build your solution.
- The solution should perform well regardless of the number of records
- Don't forget the instructions for testing and running the code.

## Development setup

### Prerequisites

* Ruby 2.2.4
* PostgreSQL 9.1+
* PostGIS 2.0+
  
To install PostgreSQL/PostGIS on Ubuntu 14.04, run:
  
    sudo apt-get -y install postgresql libpq-dev postgresql-contrib postgis postgresql-9.3-postgis-scripts

### Create development and test databases

    sudo -u postgres psql -c "CREATE USER car_api WITH SUPERUSER CREATEDB PASSWORD 'car_api';"
    rake db:setup

### Import locations from json data file

    rake car_api:locations:import
    
### Run tests

    rake test
    
### Run server

    rails server
    
### Access the API 
    
    http://localhost:3000/cars?location=51.5444204,-0.22707 
