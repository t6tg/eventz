class RegistrationsController < ApplicationController
  before_action :set_event
  before_action :require_signin, only: [ :new, :create ]

  def index
    @registrations = @event.registrations
  end


  def new
    if @event.soldout?
      redirect_to event_path(@event)
    else
      @registrations = Registration.new
    end
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user
    if @registration.save
      redirect_to event_registrations_url(@event), notice: "Thanks for registring!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:how_heard)
  end

  def set_event
    @event = Event.find_by!(slug: params[:event_id])
  end
end
