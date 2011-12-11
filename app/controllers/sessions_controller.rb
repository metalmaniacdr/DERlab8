class SessionsController < ApplicationController

  def new
    @title = "Sign in"
    @message = @title
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      @message = @title
      render 'new'
    else
      sign_in user
      flash[:success] = "Welcome to the Auto Store Service Scheduler!"
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end