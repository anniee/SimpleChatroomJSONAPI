# SimpleChatroomJSONAPI
A simple JSON API for responding to HTTP requests with an imaginary chatroom backend server

Ruby Version 2.1.2

Dependencies
  Rails Version 4.2.5
  rails-api gem
  sqlite3 database engine


How to Use This Simple Back-end Application:
  clone project git clone ____
  cd chatroom_server

  Database creation and initialization:
    rake db:create
    rake db:migrate
    rake db:seed

  Run Server
    rails server
    visit http://localhost:3000/

  Run Test Suite
    bin/rake test

  Run an Individual Test
    bin/rake test/controllers/events_controller_test.rb

  Testing with cURL
    e.g.
      {"event"{"date..."}}
