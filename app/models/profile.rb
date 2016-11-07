class Profile < ApplicationRecord
	belongs_to :user
	after_initialize :default_values

    def default_values
      self.current_gpa  ||= 4.0
      self.num_of_courses_taken ||= 0
	
    end
end
