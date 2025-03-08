class RegistrationsController < ApplicationController
  def index
    event_id = params[:event_id]
    @event = Event.find(event_id)
    @registrations = @event.registrations
  end


  def new
    @event = Event.find(params[:event_id])
    @registrations = Registration.new
  end

  def create
    # fail
    @event = Event.find(params[:event_id])
    @registrations = @event.registrations.new(registration_params)
    if @registrations.save
      redirect_to event_registrations_url(@event), notice: "Thanks for registring!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:name, :email, :how_heard)
  end
end
