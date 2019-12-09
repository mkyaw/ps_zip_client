## Table of contents
- [Table of contents](#table-of-contents)
- [General info](#general-info)
- [Technologies](#technologies)
- [Setup](#setup)

## General info
This project is a basic API client to get the population data based on the zip code given.

## Technologies
Project is created with:
* Ruby version: 2.4.4

## Setup
To run this project

1. Create a `.env` file and populate it with the correct API endpoint

```
API_URL=path/to/the/api/to/fetch/populations
```

2. Install it locally using bundler:

```
$ bundle install
```

3. Execute the client:

```
$ ruby ps_zip_client.rb {ZIPCODE}
```

If no zip code is provided in the command above, it will default to `90245`