module RegistrationsHelper
  def register_or_sold_out(event)
    if event.soldout?
      "Sold Out!"
    else
      link_to "Register!", new_event_registration_path(@event), class: "register"
    end
  end
end
