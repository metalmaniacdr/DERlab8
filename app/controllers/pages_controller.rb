class PagesController < ApplicationController
  def home
    @title = 'Home'
    @message = 'W e l c o m e !'
  end

  def contact
    @title = 'Contact'
    @message = 'Contact us'
  end

  def signin
    @title = 'Sign in'
    @message = 'Sing in'
  end

end
