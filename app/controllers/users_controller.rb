class UsersController < ApplicationController
  def new
    @title = "Sign up"
    @user = User.new
    @message = @title
  end
  
  def create 
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Auto Store Service Scheduler!"
      redirect_to user_path(@user)
    else
      @title = "Sign up"
      @message = @title
      render 'new'
    end
  end
  
   def show
    @user = User.find(params[:id])
    @title = @user.first_name + " " + @user.last_name
    @message = @title
  end
end
