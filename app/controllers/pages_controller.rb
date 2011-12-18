class PagesController < ApplicationController

  def home
    @title = 'Home'
    @appointment = Appointment.new if signed_in?
  end

  def contact
    @title = 'Contact'
    @message = 'Contact us'
  end

  
end
