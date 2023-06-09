# models/teacher.rb

require 'sinatra/activerecord'

# models/teacher.rb

class Teacher < ActiveRecord::Base
    has_many :classrooms
    has_many :students, through: :classrooms
  
    # Create a new teacher
    def self.create_teacher(params)
      Teacher.create(params)
    end
  
    # Find a teacher by ID
    def self.find_teacher(id)
      Teacher.find(id)
    end
  
    # Update a teacher
    def update_teacher(params)
      update(params)
    end
  
    # Delete a teacher
    def delete_teacher
      destroy
    end
  end
  