require 'sinatra/activerecord'

# models/attendance.rb

class Attendance < ActiveRecord::Base
  belongs_to :student

  # Create a new attendance
  def self.create_attendance(params)
    Attendance.create(params)
  end

  # Find an attendance by ID
  def self.find_attendance(id)
    Attendance.find(id)
  end

  # Update an attendance
  def update_attendance(params)
    update(params)
  end

  # Delete an attendance
  def delete_attendance
    destroy
  end
end
