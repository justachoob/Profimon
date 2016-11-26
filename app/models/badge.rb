class Badge < ApplicationRecord
    has_many :courses
    belongs_to :profile
    
    def default_values
      self.finished  ||= false
      self.first_year ||= 0
      self.second_year ||= 0
      self.third_year ||= 0
      self.fourth_year ||= 0
    end
end
