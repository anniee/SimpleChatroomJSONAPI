require 'test_helper'
# require 'minitest/autorun'
# require 'rest_client'
require 'json'
require 'factory_girl'
FactoryGirl.find_definitions

# def get
#   response = RestClient.get("http://localhost:3000/events",
#   {
#     "Content-Type" => "application/json"
#     })
#   @data = JSON.parse(response.body)
# end

#   test "gets correct user name" do
#     get
#     assert_equal "Anne", @data['user']
#   end


class EventRequestTest < ActionDispatch::IntegrationTest
  event = FactoryGirl.create(:event)


  test "gets event summary" do
    https!
    get "/events/summary"
    assert_response :success
    @data = JSON.parse(response.body)
  end

  test "gets correct user name" do
    event = FactoryGirl.create(:event)
    https!
    get "/events/#{event.id}"
    assert_equal "Anne", event['user']
  end
end
