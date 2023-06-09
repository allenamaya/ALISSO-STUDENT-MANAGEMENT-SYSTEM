require 'sinatra/base'
require_relative '../models/classroom'

# controllers/classrooms_controller.rb

class ClassroomsController < Sinatra::Base
    # Index route - list all classrooms
    get '/classrooms' do
      @classrooms = Classroom.all
      erb :'classrooms/index'
    end
  
    # Show route - display a specific classroom
    get '/classrooms/:id' do
      @classroom = Classroom.find(params[:id])
      erb :'classrooms/show'
    end
  
    # ...
  end
  
