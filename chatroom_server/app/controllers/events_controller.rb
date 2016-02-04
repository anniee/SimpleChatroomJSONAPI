class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:user]
      @events = Event.where(user: params[:user]).first
    else
      @events = Event.all.order('created_at asc')
    end

    render json: @events, :only => [:id, :date, :user, :event_type, :message, :otheruser]
  end

  # GET /events/1
  # GET /events/1.json
  def show
    # if params[:id] == "clear"
    #   @event.clear
    #   @events = Event.all
    #   @events.each { |event| event.destroy }

    #   head :no_content
    # else
    #   render json: @event
    # end
    render json: @event
  end

  # GET /events/summary
  def summary
    @events = Event.all.order('created_at asc')
    @events.each { |event|  event["highfives_count"] = event.highfives }
    render json: @events
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      @event.enters
      @event.leaves

      highfive_counter = 0
      if @event["event_type"] == "highfive"
        highfive_counter = highfive_counter + 1
        return highfive_counter
      else
        0
      end
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # POST /events/clear
  def clear
    @events = Event.all
    @events.each { |event| event.destroy }

    head :no_content
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # @event = Event.find(params[:id])

    if @event.update(event_params)
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :user, :type, :message, :otheruser)
  end
end
