class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @event = Event.find(event_show_params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_edit_params)
      flash[:notice] = "Event successfully modified"
      redirect_to edit_event_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(event_show_params[:id])
    if @event.destroy
      flash[:notice] = "Event successfully deleted"
      redirect_to root_path
    else
      render @event, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end

  def event_show_params
    params.permit(:id)
  end

  def event_edit_params
    params.require(:event).permit(:id, :name, :date)
  end
end
