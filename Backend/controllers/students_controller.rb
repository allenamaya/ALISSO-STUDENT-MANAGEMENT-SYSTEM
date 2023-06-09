require 'sinatra/base'
require_relative '../models/student'

#controllers/students_controller.rb

class StudentsController < Sinatra::Base
    # Index route - list all students
    get '/students' do
      @students = Student.all
      erb :'students/index'
    end
  
    # Show route - display a specific student
    get '/students/:id' do
      @student = Student.find(params[:id])
      erb :'students/show'
    end
  
    # New route - display a form to create a new student
    get '/students/new' do
      @student = Student.new
      erb :'students/new'
    end
  
    # Create route - create a new student
    post '/students' do
      @student = Student.new(params[:student])
      if @student.save
        redirect '/students'
      else
        erb :'students/new'
      end
    end
  
    # Edit route - display a form to edit an existing student
    get '/students/:id/edit' do
      @student = Student.find(params[:id])
      erb :'students/edit'
    end
  
    # Update route - update an existing student
    put '/students/:id' do
      @student = Student.find(params[:id])
      if @student.update(params[:student])
        redirect '/students'
      else
        erb :'students/edit'
      end
    end
  
    # Delete route - delete a student
    delete '/students/:id' do
      @student = Student.find(params[:id])
      @student.destroy
      redirect '/students'
    end
  end
  