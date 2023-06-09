require 'sinatra/base'
require_relative '../models/grade'

# controllers/grades_controller.rb

class GradesController < Sinatra::Base
    # Index route - list all grades
    get '/grades' do
      @grades = Grade.all
      erb :'grades/index'
    end
  
    # Show route - display a specific grade
    get '/grades/:id' do
      @grade = Grade.find(params[:id])
      erb :'grades/show'
    end
  
    # New route - display a form to create a new grade
    get '/grades/new' do
      @grade = Grade.new
      erb :'grades/new'
    end
  
    # Create route - create a new grade
    post '/grades' do
      @grade = Grade.new(params[:grade])
      if @grade.save
        redirect '/grades'
      else
        erb :'grades/new'
      end
    end
  
    # Edit route - display a form to edit an existing grade
    get '/grades/:id/edit' do
      @grade = Grade.find(params[:id])
      erb :'grades/edit'
    end
  
    # Update route - update an existing grade
    put '/grades/:id' do
      @grade = Grade.find(params[:id])
      if @grade.update(params[:grade])
        redirect '/grades'
      else
        erb :'grades/edit'
      end
    end
  
    # Delete route - delete a grade
    delete '/grades/:id' do
      @grade = Grade.find(params[:id])
      @grade.destroy
      redirect '/grades'
    end
  end
  