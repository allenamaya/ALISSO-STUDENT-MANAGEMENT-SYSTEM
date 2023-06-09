# controllers/user_controller.rb

class UserController < ApplicationController
    # GET /login
    def login
      # Render the login form
      erb :'users/login'
    end
  
    # POST /login
    def authenticate
      # Handle authentication logic
      # Verify user credentials and set session information
  
      # Redirect to the desired page after successful login
      redirect '/dashboard'
    end
  
    # GET /signup
    def signup
      # Render the signup form
      erb :'users/signup'
    end
  
    # POST /signup
    def register
      # Handle user registration logic
      # Create a new user record in the database
  
      # Redirect to the desired page after successful signup
      redirect '/dashboard'
    end
  
    # POST /logout
    def logout
      # Clear session information
      session.clear
  
      # Redirect to the login page or homepage
      redirect '/'
    end
  end
  