# SimpleChatroomJSONAPI
A simple JSON API for responding to HTTP requests with an imaginary chatroom backend server

##Requirements
Ruby Version 2.1.2

####Dependencies (main Ruby Gems)
  * Rails version 4.2.5
  * rails-api
  * factory_girl (used in addition to fixtures)
  * sqlite3

##How to Use This Simple Back-end Application:
1. Clone project `git clone https://github.com/anniee/SimpleChatroomJSONAPI.git`

      `cd chatroom_server`

2. Database creation and initialization:

        rake db:create
        rake db:migrate
        rake db:seed

3. Run Server (in separate terminal tab):

        rails server

    In browser, visit http://localhost:3000/

4. Run Tests

   Test Suite

    `bin/rake test`

   Individual Test

    `bin/rake test/controllers/events_controller_test.rb`

  Testing with cURL

  e.g.
`curl -H "Content-Type: application/json" -X POST -d '{"event":{"user": "Annie", "event_type": "enter"}}' http://localhost:3000/events`

  would yield a "201" successfully-created status
