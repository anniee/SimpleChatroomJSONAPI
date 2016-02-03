require 'active_support/core_ext/enumerable'

class Event < ActiveRecord::Base
  # Event.date = Event[created_at]

  def enters
    enter_counter = 0
    if self.event_type == "enter"
      enter_counter = enter_counter + 1
      # return self.event_type
      # self.sum(:event_type)
      return enter_counter
    else
      return 0
    end
  end

  def leaves
    leave_counter = 0
    if self.event_type == "leave"
      leave_counter = leave_counter + 1
      # @event.sum(:event_type)
      return leave_counter
    else
      0
    end
  end

  def comments
    comment_counter = 0
    if self.message != ""
      comment_counter = comment_counter + 1
      return comment_counter
    else
      0
    end
  end
end

public

def highfives
  @event = self
  @event.respond_to?(:to_h)
  return @event.to_h
  # return @event_hash
  # highfive_counter = 0
  # if @event["event_type"] == "highfive"
  #   highfive_counter = highfive_counter + 1
  #   return highfive_counter
  # else
  #   0
  # end
end
