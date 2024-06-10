class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(current_user.id)
    if user.created_events.create!(event_params)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(event_show_params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end

  def event_show_params
    params.permit(:id)
  end
end
