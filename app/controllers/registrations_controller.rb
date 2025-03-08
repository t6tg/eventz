class RegistrationsController < ApplicationController
  before_action :set_event

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

  def set_event
    @event = Event.find(params[:event_id])
  end
end
