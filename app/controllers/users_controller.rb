class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :show, :destroy, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:index, :destroy, :show]
  
  def new
    @title = "Sign up"
    @user = User.new
    @message = @title
  end
  
  def create 
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
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
   
  def edit
    @title = "Edit user"
    @message = @title
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      @message = @title
      render 'edit'
    end
  end
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
    @message = @title
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
