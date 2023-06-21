require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

# Models
require './models/student'
require './models/teacher'
require './models/grade'
require './models/attendance'
require './models/assignment'

# Enable sessions for user authentication
enable :sessions

# Helper method to check if user is logged in
def logged_in?
  !session[:user_id].nil?
end

# Routes

# Main route
get './' do
  erb :index
end

# Authentication routes

# Student login
get '/student/login' do
  erb :'student/login'
end

post '/student/login' do
  student = Student.find_by(email: params[:email])
  if student && BCrypt::Password.new(student.password) == params[:password]
    session[:user_id] = student.id
    redirect '/student/dashboard'
  else
    @error = 'Invalid email or password'
    erb :'student/login'
  end
end

# Teacher login
get '/teacher/login' do
  erb :'teacher/login'
end

post '/teacher/login' do
  teacher = Teacher.find_by(email: params[:email])
  if teacher && BCrypt::Password.new(teacher.password) == params[:password]
    session[:user_id] = teacher.id
    redirect '/teacher/dashboard'
  else
    @error = 'Invalid email or password'
    erb :'teacher/login'
  end
end

# Logout
post '/logout' do
  session.clear
  redirect '/'
end

# Student routes

# Student dashboard
get '/student/dashboard' do
  redirect '/student/login' unless logged_in?
  # Render the student dashboard
  erb :'student/dashboard'
end

# Student profile
get '/student/profile' do
  redirect '/student/login' unless logged_in?
  # Retrieve and render the student's profile
  @student = Student.find(session[:user_id])
  erb :'student/profile'
end

# Teacher routes

# Teacher dashboard
get '/teacher/dashboard' do
  redirect '/teacher/login' unless logged_in?
  # Render the teacher dashboard
  erb :'teacher/dashboard'
end

# Teacher profile
get '/teacher/profile' do
  redirect '/teacher/login' unless logged_in?
  # Retrieve and render the teacher's profile
  @teacher = Teacher.find(session[:user_id])
  erb :'teacher/profile'
end

# Error handling

# 404 Not Found
not_found do
  erb :'errors/404'
end


