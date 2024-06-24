class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if EventAttendee.where("event_attendee_id = ? AND attended_event_id = ?", current_user.id, event_params[:id]).any?
      flash[:alert] = "You already are attending this event!"
      redirect_to event_path(event_params[:id])
    else
      event_attendee = EventAttendee.new
      event_attendee.event_attendee_id = current_user.id
      event_attendee.attended_event_id = event_params[:id]
      if event_attendee.save!
        redirect_to event_path(event_params[:id])
      else
        flash[:alert] = "The event you are trying to attend didn't exist or has been deleted by the creator"
        redirect_to root_path
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:id)
  end
end
