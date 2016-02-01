class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:username]
      @events = Event.where(user: params[:username]).first
      #add .order('created_at asc')
    else
      @events = Event.all.order('created_at asc')
    end
    render json: @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event
  end

  # GET /events/summary
  # def summary
  #   render json: @events
  # end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # POST /events/clear
  def clear
    Event.all.destroy
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
