require 'test_helper'
require 'json'
require 'factory_girl'
FactoryGirl.find_definitions

class EventRequestTest < ActionDispatch::IntegrationTest
  event = FactoryGirl.create(:event)


  test "gets event summary" do
    https!
    get "/events/summary"
    assert_response :success
    @data = JSON.parse(response.body)
#fix this so checks body of response for accuracy
    # puts @data
  end

  test "gets correct user name" do
    event = FactoryGirl.create(:event)
    https!
    get "/events/#{event.id}"
    assert_equal "Anne", event['user']
    assert_equal "enter", event['event_type']
  end

  # TO-DO test get event, test post events/, test post events/clear, test get events with date range, test get events summary (ideally, with date range, not just specific date)
end
