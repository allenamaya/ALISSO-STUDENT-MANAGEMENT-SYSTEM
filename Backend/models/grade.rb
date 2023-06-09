require 'sinatra/activerecord'

# models/grade.rb

class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  # Create a new grade
  def self.create_grade(params)
    Grade.create(params)
  end

  # Find a grade by ID
  def self.find_grade(id)
    Grade.find(id)
  end

  # Update a grade
  def update_grade(params)
    update(params)
  end

  # Delete a grade
  def delete_grade
    destroy
  end
end
