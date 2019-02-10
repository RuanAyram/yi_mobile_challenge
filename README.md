# README

## Tools

| Tool  | Purpose |
| :---: |:-------:|
| [Postman](https://www.getpostman.com/) | Requests in the api |


## Gems

| Gems  | Purpose |
| :---: |:-------:|
| [Rspec](https://github.com/rspec/rspec-rails) | Default tests |
| [Rubocop](https://github.com/rubocop-hq/rubocop) | Static code analyzer and formatter |
|  |  |
| General | Version |
| Ruby  | 2.5.1 |
| Rails | 5.2.2 |


## Getting started

Clone the repository
```
git clone https://github.com/RuanAyram/yi_mobile_challenge
```

Enter in the folder, then run these commands to install gems, create a database and populate, then run api locally
```
cd yi_mobile_challenge

bundle install

rails db:create && rails db:migrate && rails db:seed

rails s
```

## My API Endpoints

### Events
> GET http://localhost:3000/api/v1/events
 - returns a list of all events in the database
> POST http://localhost:3000/api/v1/events
 - Body JSON format (required)
 ```javascript
{
  "event": {
    "name": "I don't have a name",
    "description": "This is the description",
    "lat": -5.1863822,
    "lng": -43.0643717
  }
}
  ```

### Comments
> GET http://localhost:3000/api/v1/comments
  - returns a list of all comments in the database
> GET http://localhost:3000/api/v1/comments?flagged=true
  - returns a list of all flagged comments in database
> POST http://localhost:3000/api/v1/comments
 - Body JSON format (required)
 ```javascript
{
  "comment": {
    "text": "My first comment",
    "user_id": 1,
    "event_id": 1,
    "flagged": true  /* optional */
  }
}
  ```

## For test, run:
 ```
  bundle exec rspec
 ```
