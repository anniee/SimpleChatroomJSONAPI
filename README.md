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

  would yield a "201" successfully created status

##Description of Application
  This bare bones server handles requests related to "events" in a chatroom (edge cases are not currently considered). These events have attributes such as a user's name and the event_type, meaning what action the user is performing in the chatroom (e.g. entering the chatroom, messaging in it, high-fiving another user, leaving the chatroom).

Currently:

  GET / or /events --> 200 OK status
  POST /events --> 201 Successfully Created status
  GET /events/summary --> 200 OK status, in progress events summary (e.g. highfive counter for specific date)
  POST /events/clear --> 204 No Content Status (i.e.g. clears data)

To Tackle in Future:

  Other event summary attributes, e.g. enters and leaves

  Finish tests for controller, requests (called integration even though no UI), and model

  GETting index of events, in ascending order, by specified date range

  Error hash status

  Validations for 'otheruser' when event type is 'highfive'
