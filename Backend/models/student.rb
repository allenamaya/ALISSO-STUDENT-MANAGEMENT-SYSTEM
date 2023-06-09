# models/student.rb

require 'sinatra/activerecord'


# models/student.rb

class Student < ActiveRecord::Base
  has_many :grades
  has_many :attendances
  has_many :assignments, through: :grades

  # Create a new student
  def self.create_student(params)
    Student.create(params)
  end

  # Find a student by ID
  def self.find_student(id)
    Student.find(id)
  end

  # Update a student
  def update_student(params)
    update(params)
  end

  # Delete a student
  def delete_student
    destroy
  end
end


