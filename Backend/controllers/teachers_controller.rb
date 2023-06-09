require 'sinatra/base'
require_relative '../models/teacher'

# controllers/teachers_controller.rb

class TeachersController < Sinatra::Base
    # Index route - list all teachers
    get '/teachers' do
      @teachers = Teacher.all
      erb :'teachers/index'
    end
  
    # Show route - display a specific teacher
    get '/teachers/:id' do
      @teacher = Teacher.find(params[:id])
      erb :'teachers/show'
    end
  
    
  end
  