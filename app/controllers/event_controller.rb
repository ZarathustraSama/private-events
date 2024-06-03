class EventController < ApplicationController
  def index
    @events = Events.all
  end
end
