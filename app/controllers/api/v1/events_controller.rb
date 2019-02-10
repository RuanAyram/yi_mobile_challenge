# frozen_string_literal: true

class Api::V1::EventsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /api/v1/events
  def index
    @events = Event.all
    render json: { events: @events, status: :ok }
  end

  # GET /api/v1/events/1
  def show
    render json: { event: @event, status: :ok }
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if @event.update(event_params)
      render json: { event: @event, status: :ok }
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    @event.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:name, :description, :lat, :lng)
  end
end
