require 'sinatra/base'
require_relative '../models/assignment'

# controllers/assignments_controller.rb

class AssignmentsController < Sinatra::Base
  set :default_content_type, `application/json`
    # Index route - list all assignments
    get '/assignments' do
      @assignments = Assignment.all
      erb :'assignments/index'
    end
  
    # Show route - display a specific assignment
    get '/assignments/:id' do
      @assignment = Assignment.find(params[:id])
      erb :'assignments/show'
    end
  
    # New route - display a form to create a new assignment
    get '/assignments/new' do
      @assignment = Assignment.new
      erb :'assignments/new'
    end
  
    # Create route - create a new assignment
    post '/assignments' do
      @assignment = Assignment.new(params[:assignment])
      if @assignment.save
        redirect '/assignments'
      else
        erb :'assignments/new'
      end
    end
  
    # Edit route - display a form to edit an existing assignment
    get '/assignments/:id/edit' do
      @assignment = Assignment.find(params[:id])
      erb :'assignments/edit'
    end
  
    # Update route - update an existing assignment
    put '/assignments/:id' do
      @assignment = Assignment.find(params[:id])
      if @assignment.update(params[:assignment])
        redirect '/assignments'
      else
        erb :'assignments/edit'
      end
    end
  
    # Delete route - delete an assignment
    delete '/assignments/:id' do
      @assignment = Assignment.find(params[:id])
      @assignment.destroy
      redirect '/assignments'
    end
  end
  