require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "enters amount" do
    event = FactoryGirl.create(:event, :event_type => "enter")
    assert_equal 1, event.enters()
  end

  test "leaves amount" do
    @event = FactoryGirl.create(:event, :event_type => "leave")
    assert_equal 1, @event.leaves()
  end
end
