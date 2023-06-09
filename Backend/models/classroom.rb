require 'sinatra/activerecord'


# models/classroom.rb

class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :students

  # Create a new classroom
  def self.create_classroom(params)
    Classroom.create(params)
  end

  # Find a classroom by ID
  def self.find_classroom(id)
    Classroom.find(id)
  end

  # Update a classroom
  def update_classroom(params)
    update(params)
  end

  # Delete a classroom
  def delete_classroom
    destroy
  end
end
