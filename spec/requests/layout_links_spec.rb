require 'spec_helper'

describe "LayoutLinks" do
  
    it "should have a home page at '/'" do
      get '/'
      response.should have_selector("title", :content => "Home")
    end
  
    it "should have a contact page at '/contact'" do
      get '/contact'
      response.should have_selector("title", :content => "Contact")
    end
    
    it "should have a signin page at '/signin'" do
      get '/signin'
      response.should have_selector("title", :content => "Sign in")
    end
    
    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector("title", :content => "Sign up")
    end

    
    it "should have the right links on the layout" do
      visit root_path
      response.should have_selector('title', :content => "Home")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Sign in"
      response.should have_selector('title', :content => "Sign in")
      response.should have_selector('a[href="/"]>img')
    end
end