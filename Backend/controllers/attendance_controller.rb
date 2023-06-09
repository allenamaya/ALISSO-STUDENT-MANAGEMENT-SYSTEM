require 'sinatra/base'
require_relative '../models/attendance'

# controllers/attendances_controller.rb

class AttendancesController < Sinatra::Base
    # Index route - list all attendances
    get '/attendances' do
      @attendances = Attendance.all
      erb :'attendances/index'
    end
  
    # Show route - display a specific attendance
    get '/attendances/:id' do
      @attendance = Attendance.find(params[:id])
      erb :'attendances/show'
    end
  
    # New route - display a form to create a new attendance
    get '/attendances/new' do
      @attendance = Attendance.new
      erb :'attendances/new'
    end
  
    # Create route - create a new attendance
    post '/attendances' do
      @attendance = Attendance.new(params[:attendance])
      if @attendance.save
        redirect '/attendances'
      else
        erb :'attendances/new'
      end
    end
  
    # Edit route - display a form to edit an existing attendance
    get '/attendances/:id/edit' do
      @attendance = Attendance.find(params[:id])
      erb :'attendances/edit'
    end
  
    # Update route - update an existing attendance
    put '/attendances/:id' do
      @attendance = Attendance.find(params[:id])
      if @attendance.update(params[:attendance])
        redirect '/attendances'
      else
        erb :'attendances/edit'
      end
    end
  
    # Delete route - delete an attendance
    delete '/attendances/:id' do
      @attendance = Attendance.find(params[:id])
      @attendance.destroy
      redirect '/attendances'
    end
  end
  