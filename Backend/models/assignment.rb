require 'sinatra/activerecord'

# models/assignment.rb

class Assignment < ActiveRecord::Base
  has_many :grades
  has_many :students, through: :grades

  # Create a new assignment
  def self.create_assignment(params)
    Assignment.create(params)
  end

  # Find an assignment by ID
  def self.find_assignment(id)
    Assignment.find(id)
  end

  # Update an assignment
  def update_assignment(params)
    update(params)
  end

  # Delete an assignment
  def delete_assignment
    destroy
  end
end
