class AppointmentsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

 def create
    @appointment = current_user.appointments.build(params[:appointment])
    if @appointment.save
      flash[:success] = "Appointment created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end