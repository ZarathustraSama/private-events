class UsersController < ApplicationController
  def show
    user = User.find(current_user.id)
    @events = user.created_events.all
  end
end
